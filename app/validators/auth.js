exports.create = (request) => {
  const errors = [];
  if (request.email === "") {
    errors.push("ایمیل کاربر نمی تواند خالی باشد");
  }
  if (request.password === "") {
    errors.push("پسوورد نمی تواند خالی باشد");
  }
  return errors;
};

// Final Edition
