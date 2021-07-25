const db = require("@database/mysql");

exports.findAll = async (columns = []) => {
  const sqlcolumns = columns.length > 0 ? columns.join(",") : "*";
  const [rows, fields] = await db.query(`SELECT ${sqlcolumns} FROM settings`);
  return rows;
};

exports.update = async (updateFields) => {
  Object.keys(updateFields).forEach((setting_name) => {
    db.query(
      `UPDATE settings SET setting_value = ?
     WHERE setting_name = ?`,
      [updateFields[setting_name], setting_name]
    );
  });
};
