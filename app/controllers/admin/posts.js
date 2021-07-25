const postModel = require("@models/post");
const userModel = require("@models/user");
const dateService = require("@services/dateService");
const langService = require("@services/langService");
const postValidators = require("@validators/post");
const { statuses } = require("@models/post/postStatus");

exports.index = async (req, res) => {
  const posts = await postModel.findAll();
  const presentedPosts = posts.map((post) => {
    post.jalali_created_at = langService.toPersianNumbers(
      dateService.toPersiandate(post.created_at)
    );
    post.persian_views = langService.toPersianNumbers(post.views);
    return post;
  });
  res.adminRender("admin/posts/index.handlebars", {
    posts: presentedPosts,
  });
};

exports.create = async (req, res) => {
  const users = await userModel.findAll(["id", "full_name"]);
  res.adminRender("admin/posts/create.handlebars", { users });
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
    req.flash("errors", errors);
    return res.redirect("/admin/posts/create");
  }
  const insertID = await postModel.create(postData);
  req.flash("success", "مطلب جدید با موفقیت ایجاد شد");
  res.redirect("/admin/posts");
};

exports.remove = async (req, res) => {
  const postID = req.params.postID;
  if (parseInt(postID === 0)) {
    res.redirect("/admin/posts");
  }
  const result = await postModel.delete(postID);
  req.flash("success", "مطلب با موفقیت حذف شد");
  res.redirect("/admin/posts");
};

exports.edit = async (req, res) => {
  const postID = req.params.postID;
  if (parseInt(postID === 0)) {
    res.redirect("/admin/posts");
  }
  const post = await postModel.find(postID);
  const users = await userModel.findAll(["id", "full_name"]);
  res.adminRender("admin/posts/edit.handlebars", {
    users,
    post,
    postStatus: statuses(),
    helpers: {
      isPostAuthor: function (userID, options) {
        return post.author_id === userID
          ? options.fn(this)
          : options.inverse(this);
      },
      isSelectedStatus: function (status, options) {
        return post.status === status
          ? options.fn(this)
          : options.inverse(this);
      },
    },
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
  req.flash("success", "مطلب با موفقیت ویرایش شد");
  return res.redirect("/admin/posts");
};
