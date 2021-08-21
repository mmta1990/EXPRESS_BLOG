const dateService = require("@services/dateService");
const langService = require("@services/langService");

class PostPresenter {
  constructor(post) {
    this.post = post;
  }
  jalaliCreatedAt() {
    return langService.toPersianNumbers(
      dateService.toPersiandate(this.post.created_at)
    );
  }
  persianViews() {
    return langService.toPersianNumbers(this.post.views);
  }
  excerpt(words_limit = 20) {
    const words = this.post.content.split(" ");
    return words.slice(0, words_limit - 1).join(" ") + " ...";
  }
}

module.exports = PostPresenter;
