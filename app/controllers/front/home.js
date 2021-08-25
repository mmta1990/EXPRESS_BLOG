const postModel = require("@models/post");
const postPresenter = require("@presenters/post");
const settingModel = require("@models/setting");

exports.index = async (req, res) => {
  const page = "page" in req.query ? parseInt(req.query.page) : 1;
  const perPage = parseInt(await settingModel.get("posts_per_page"));
  const posts = await postModel.findAll(page, perPage);
  const totalPosts = await postModel.count();
  const totalPages = Math.ceil(totalPosts / perPage);
  const pagination = {
    page,
    totalPages,
    nextPage: page < totalPages ? page + 1 : totalPages,
    prevPage: page > 1 ? page - 1 : 1,
    hasNextPage: page < totalPages,
    hasPrevPage: page > 1,
  };

  const postsForPresent = posts.map((post) => {
    const postPresenterInstance = new postPresenter(post);
    post.jalali_date = postPresenterInstance.jalaliCreatedAt();
    post.excerpt = postPresenterInstance.excerpt();
    return post;
  });

  const latestPosts = await postModel.latestPosts(3);
  res.frontRender("front/home/index.handlebars", {
    posts: postsForPresent,
    pagination,
    latestPosts,
    helpers: {
      showDisabled: function (isDisabled, options) {
        return !isDisabled ? "disabled" : "";
      },
    },
  });
};

exports.search = async (req, res) => {
  const posts = await postModel.findByKeyword(req.query.keyword);

  const postsForPresent = posts.map((post) => {
    const postPresenterInstance = new postPresenter(post);
    post.jalali_date = postPresenterInstance.jalaliCreatedAt();
    post.excerpt = postPresenterInstance.excerpt();
    return post;
  });

  res.frontRender("front/home/search.handlebars", {
    posts: postsForPresent,
  });
};

// Final Edition
