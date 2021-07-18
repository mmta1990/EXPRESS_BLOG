const postModel = require('@models/post');
const dateService = require('@services/dateService');
const langService = require('@services/langService');

exports.index = async (req, res) => {
    const posts = await postModel.findAll();
    const presentedPosts = posts.map(post => {
        post.jalali_created_at = langService.toPersianNumbers(dateService.toPersiandate(post.created_at));
        post.persian_views = langService.toPersianNumbers(post.views);
        return post;
    });
    res.render('admin/posts/index.handlebars', {layout : 'admin', posts: presentedPosts});
};