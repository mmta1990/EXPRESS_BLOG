const jalaliMoment = require("jalali-moment");

exports.toPersiandate = (date, format = "YYYY/MM/DD") => {
  return jalaliMoment(date).locale("fa").format(format);
};

// Final Edition
