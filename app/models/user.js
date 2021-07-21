const db = require("@database/mysql");

exports.findAll = async (columns = []) => {
  const sqlcolumns = columns.length > 0 ? columns.join(",") : "*";
  const [rows, fields] = await db.query(`SELECT ${sqlcolumns} FROM users`);
  return rows;
};
