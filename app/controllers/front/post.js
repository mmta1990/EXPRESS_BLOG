const postModel = require("@models/post");
const userModel = require("@models/user");
const commentModel = require("@models/comment");
const settingModel = require("@models/setting");
const userService = require("@services/userService");
const postPresenter = require("@presenters/post");
const _ = require("lodash");

exports.showPost = async (req, res) => {
  const postSlug = req.params.post_slug;
  const posts = await postModel.findAll();
  const post = await postModel.findBySlug(postSlug);
  if (!post) {
    return res.redirect("/404");
  }

  const user = await userModel.find(post.author_id);
  user.avatar = userService.gravatar(user.email);
  post.author = user;
  const postsForPresent = posts.map((post) => {
    const postPresenterInstance = new postPresenter(post);
    post.jalali_date = postPresenterInstance.jalaliCreatedAt();
    return post;
  });

  const comments = await commentModel.findByPostID(post.id);
  const presentedComments = comments.map((comment) => {
    comment.avatar = userService.gravatar(comment.user_email);
    const commentPresenterInstance = new postPresenter(comment);
    comment.jalali_date = commentPresenterInstance.jalaliCreatedAt();
    return comment;
  });

  const newComments = _.groupBy(presentedComments, "parent");
  let pageTitle = await settingModel.get("website_title");

  res.frontRender("front/post/single.handlebars", {
    post,
    posts: postsForPresent,
    comments: newComments[0],
    bodyClass: "single-post",
    title: `${pageTitle} || ${post.title}`,
    helpers: {
      hasChildren: function (commentID, options) {
        return commentID in newComments;
      },
      getChildren: function (commentID, options) {
        return newComments[commentID];
      },
    },
  });
};
