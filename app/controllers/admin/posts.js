const postModel = require("@models/post");
const userModel = require("@models/user");
const dateService = require("@services/dateService");
const langService = require("@services/langService");
const postValidators = require("@validators/post");

exports.index = async (req, res) => {
  const posts = await postModel.findAll();
  const presentedPosts = posts.map((post) => {
    post.jalali_created_at = langService.toPersianNumbers(
      dateService.toPersiandate(post.created_at)
    );
    post.persian_views = langService.toPersianNumbers(post.views);
    return post;
  });
  res.render("admin/posts/index.handlebars", {
    layout: "admin",
    posts: presentedPosts,
  });
};

exports.create = async (req, res) => {
  const users = await userModel.findAll(["id", "full_name"]);
  res.render("admin/posts/create.handlebars", {
    layout: "admin",
    users,
  });
};

exports.store = async (req, res) => {
  const postData = {
    author_id: req.body.author,
    title: req.body.title,
    slug: req.body.slug,
    content: req.body.content,
    status: req.body.status,
  };
  const errors = postValidators.create(postData);
  if (errors.length > 0) {
    const users = await userModel.findAll(["id", "full_name"]);
    return res.render("admin/posts/create.handlebars", {
      layout: "admin",
      users,
      errors,
      hasError: errors.length > 0,
    });
  }
  const insertID = await postModel.create(postData);
  // if (insertID) {
  //   res.redirect("/admin/posts");
  // }
  res.redirect("/admin/posts");
};

exports.remove = async (req, res) => {
  const postID = req.params.postID;
  if (parseInt(postID === 0)) {
    res.redirect("/admin/posts");
  }
  const result = await postModel.delete(postID);
  res.redirect("/admin/posts");
};

exports.edit = async (req, res) => {
  const postID = req.params.postID;
  if (parseInt(postID === 0)) {
    res.redirect("/admin/posts");
  }
  const post = await postModel.find(postID);
  const users = await userModel.findAll(["id", "full_name"]);
  res.render("admin/posts/edit.handlebars", {
    layout: "admin",
    users,
    post,
  });
};

exports.update = async (req, res) => {
  const postID = req.params.postID;
  if (parseInt(postID === 0)) {
    res.redirect("/admin/posts");
  }
  const postData = {
    author_id: req.body.author,
    title: req.body.title,
    slug: req.body.slug,
    content: req.body.content,
    status: req.body.status,
  };
  const result = await postModel.update(postID, postData);
  return res.redirect("/admin/posts");
};
