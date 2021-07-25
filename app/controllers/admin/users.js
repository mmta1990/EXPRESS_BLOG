const userModel = require("@models/user");
const dateService = require("@services/dateService");
const langService = require("@services/langService");
const userValidators = require("@validators/user");
const { roles } = require("@models/user/userRole");

exports.index = async (req, res) => {
  const users = await userModel.findAll();
  const presentedusers = users.map((user) => {
    user.jalali_created_at = langService.toPersianNumbers(
      dateService.toPersiandate(user.created_at)
    );
    user.persian_views = langService.toPersianNumbers(user.views);
    return user;
  });
  res.adminRender("admin/users/index.handlebars", {
    users: presentedusers,
  });
};

exports.create = async (req, res) => {
  res.adminRender("admin/users/create.handlebars");
};

exports.store = async (req, res) => {
  const userData = {
    full_name: req.body.full_name,
    email: req.body.email,
    password: req.body.password,
    role: req.body.role,
  };
  const errors = userValidators.create(userData);
  if (errors.length > 0) {
    req.flash("errors", errors);
    return res.redirect("/admin/users/create");
  }
  const insertID = await userModel.create(userData);
  req.flash("success", "کاربر جدید با موفقیت ایجاد شد");
  res.redirect("/admin/users");
};

exports.remove = async (req, res) => {
  const userID = req.params.userID;
  if (parseInt(userID === 0)) {
    res.redirect("/admin/users");
  }
  const result = await userModel.delete(userID);
  req.flash("success", "کاربر با موفقیت حذف شد");
  res.redirect("/admin/users");
};

exports.edit = async (req, res) => {
  const userID = req.params.userID;
  if (parseInt(userID === 0)) {
    res.redirect("/admin/users");
  }
  const user = await userModel.find(userID);
  const users = await userModel.findAll(["id", "full_name"]);
  res.adminRender("admin/users/edit.handlebars", {
    users,
    user,
    userRole: roles(),
    helpers: {
      isSelectedRole: function (role, options) {
        return user.role === role ? options.fn(this) : options.inverse(this);
      },
    },
  });
};

exports.update = async (req, res) => {
  const userID = req.params.userID;
  if (parseInt(userID === 0)) {
    res.redirect("/admin/users");
  }
  const userData = {
    full_name: req.body.full_name,
    email: req.body.email,
    password: req.body.password,
    role: req.body.role,
  };
  const result = await userModel.update(userID, userData);
  req.flash("success", "کاربر با موفقیت ویرایش شد");
  return res.redirect("/admin/users");
};
