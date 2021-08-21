const db = require("@database/mysql");

exports.findAll = async (columns = []) => {
  const sqlcolumns = columns.length > 0 ? columns.join(",") : "*";
  const [rows, fields] = await db.query(`SELECT ${sqlcolumns} FROM settings`);
  return rows;
};

exports.update = async (updateFields) => {
  Object.keys(updateFields).forEach((setting_name) => {
    db.query(
      `
    UPDATE settings
    SET setting_value = ?
    WHERE setting_name = ?
     `,
      [updateFields[setting_name], setting_name]
    );
  });
};

exports.get = async (key) => {
  const [rows] = await db.query(
    `
    SELECT setting_value
    FROM settings
    WHERE setting_name = ?
    LIMIT 1
     `,
    [key]
  );
  return rows.length > 0 ? rows[0].setting_value : null;
};
