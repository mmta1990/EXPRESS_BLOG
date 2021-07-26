const authService = require("@services/authService");
const authValidators = require("@validators/auth");
const { roles } = require("@models/user/userRole");
const userRoles = roles();

exports.showLogin = (req, res) => {
  res.authRender("auth/login.handlebars");
};
exports.doLogin = async (req, res) => {
  const { email, password } = req.body;
  const user = await authService.login(email, password);
  if (!user) {
    req.flash("errors", ["ایمیل یا کلمه عبور معتبر نمی باشد"]);
    return res.redirect("/auth/login");
  }
  req.session.user = user;
  const pathToRedirect =
    user.role === userRoles.USER ? "/" : "/admin/dashboard";
  return res.redirect(pathToRedirect);
};
exports.showRegister = (req, res) => {
  res.authRender("auth/register.handlebars");
};
exports.doRegister = async (req, res) => {
  const { email, password, password_confirmation } = req.body;
  const newUserID = await authService.register(email, password);
  if (!newUserID) {
    req.flash("errors", ["در حال حاضر امکان ثبت نام شما وجود ندارد"]);
    return res.redirect("/auth/register");
  }
  req.flash("success", [
    "ثبت نام شما با موفقیت انجام شد \n حالا می توانید به محیط سایت وارد شوید",
  ]);
  return res.redirect("/auth/login");
};
exports.logout = async (req, res) => {
  req.session.destroy((error) => {
    res.redirect("/auth/login");
  });
};
