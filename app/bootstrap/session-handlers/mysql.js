module.exports = (session) => {
  const MySQLStore = require("express-mysql-session")(session);

  const mysqlOptions = {
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    port: process.env.MYSQL_PORT,
    database: process.env.MYSQL_DATABASE,
    clearExpired: true,
  };
  return new MySQLStore(mysqlOptions);
};

// Final Edition
