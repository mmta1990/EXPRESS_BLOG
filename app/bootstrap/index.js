const express = require("express");
const hbs = require("express-handlebars");
const path = require("path");
const cookieParser = require("cookie-parser");
const session = require("express-session");
const connectFlash = require("connect-flash");

module.exports = (app) => {
  app.use(express.json());
  app.use(express.urlencoded({ extended: false }));
  app.use(cookieParser());
  app.use(
    session({
      secret: "1234567890abcdefghij!@#$%^&*()",
      resave: true,
      saveUninitialized: true,
      cookie: { maxAge: 60000 },
    })
  );
  app.use(connectFlash());
  app.engine("handlebars", hbs());
  app.set("view engin", "handlebars");
  app.set("views", path.join(__dirname, "../views"));
  app.use("/static", express.static(path.join(__dirname, "../../public")));
};
