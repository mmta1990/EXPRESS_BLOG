const { gravatar } = require("@services/userService");

module.exports = (app) => {
  app.use((req, res, next) => {
    const errors = req.flash("errors");
    const success = req.flash("success");
    const hasError = errors.length > 0;

    let user = null;
    if ("user" in req.session) {
      user = req.session.user;
      user.avatar = gravatar(user.email);
    }

    res.adminRender = (template, options) => {
      options = {
        ...options,
        layout: "admin",
        hasError,
        errors,
        success,
        user,
      };
      res.render(template, options);
    };

    res.authRender = (template, options) => {
      options = { ...options, layout: "auth", hasError, errors, success, user };
      res.render(template, options);
    };

    res.frontRender = (template, options) => {
      options = {
        layout: "front",
        bodyClass: "bg-gray",
        ...options,
        hasError,
        errors,
        success,
        user,
      };
      res.render(template, options);
    };
    next();
  });
};
