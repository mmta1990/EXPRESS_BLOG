const settingModel = require("@models/setting");
const definedSettings = require("@config/settings");

exports.index = async (req, res) => {
  const settings = await settingModel.findAll();
  const presentedSettings = {};
  settings.forEach((item) => {
    presentedSettings[item.setting_name] = item.setting_value;
  });
  res.adminRender("admin/settings/index.handlebars", {
    config: presentedSettings,
    helpers: {
      isChecked: function (value, options) {
        return parseInt(value) === 1 ? options.fn(this) : options.inverse(this);
      },
    },
  });
};

exports.store = async (req, res) => {
  const settings = req.body;
  const premittedSettingkeys = Object.keys(settings).filter((setting) => {
    return Object.keys(definedSettings).includes(setting);
  });
  const premittedSettings = {};
  premittedSettingkeys.forEach((key) => {
    premittedSettings[key] = settings[key];
  });
  const validatedSettings = {
    ...definedSettings,
    ...premittedSettings,
  };
  // Object.keys(settings).forEach((setting_name) => {
  //   if (settings[setting_name] === "on") {
  //     validatedSettings[setting_name] = 1;
  //   } else {
  //     validatedSettings[setting_name] = settings[setting_name];
  //   }
  // });
  const result = await settingModel.update(validatedSettings);
  req.flash("success", "تنظیمات با موفقیت ویرایش شد");
  res.redirect("/admin/settings");
};
