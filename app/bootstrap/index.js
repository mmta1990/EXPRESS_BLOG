const express = require("express");
const hbs = require("express-handlebars");
const path = require("path");
const cookieParser = require("cookie-parser");
const session = require("express-session");
const connectFlash = require("connect-flash");
const fileUpload = require("express-fileupload");
const sessionStore = require("./session-handlers/mysql")(session); //for MYSQL Sessions
// const sessionStore = require("./session-handlers/redis")(session); //for Redis Sessions

module.exports = (app) => {
  app.use(express.json());
  app.use(express.urlencoded({ extended: false }));
  app.use(cookieParser());
  app.use(
    session({
      store: sessionStore,
      secret: "1234567890abcdefghij!@#$%^&*()",
      resave: true,
      saveUninitialized: true,
      cookie: { maxAge: 600000 },
      unset: "destroy",
    })
  );
  app.use(connectFlash());
  app.use(
    fileUpload({
      createParentPath: true,
      useTempFiles: true,
    })
  );
  app.engine("handlebars", hbs());
  app.set("view engin", "handlebars");
  app.set("views", path.join(__dirname, "../views"));
  app.use("/static", express.static(path.join(__dirname, "../../public")));
};

// Final Edition
