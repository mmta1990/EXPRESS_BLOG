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
}

module.exports = PostPresenter;
