const userRoles = {
  USER: 0,
  WRITER: 1,
  ADMIN: 2,
};

const rolesAsText = {
  [userRoles.USER]: "کاربر",
  [userRoles.WRITER]: "نویسنده",
  [userRoles.ADMIN]: "مدیر",
};

exports.roles = () => {
  return userRoles;
};

exports.readableRoles = (role = null) => {
  return role ? rolesAsText[role] : rolesAsText;
};

// Final Edition
