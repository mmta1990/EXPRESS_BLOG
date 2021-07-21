const express = require("express");
const hbs = require("express-handlebars");
const path = require("path");

module.exports = (app) => {
  app.use(express.json());
  app.use(express.urlencoded({ extended: false }));
  app.engine("handlebars", hbs());
  app.set("view engin", "handlebars");
  app.set("views", path.join(__dirname, "../views"));
  app.use("/static", express.static(path.join(__dirname, "../../public")));
};
