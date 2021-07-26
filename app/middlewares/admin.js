const { roles } = require("@models/user/userRole");
const userRoles = roles();

module.exports = (req, res, next) => {
  if (req.session.user.role === userRoles.USER) {
    return res.redirect("/");
  }
  next();
};
