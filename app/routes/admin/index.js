const express = require("express");
const router = express.Router();

//Router
const dashboardRouter = require("./dashboard");
const postRouter = require("./posts");
const commentsRouter = require("./comments");
const usersRouter = require("./users");
const settingsRouter = require("./settings");

router.use("/dashboard", dashboardRouter);
router.use("/posts", postRouter);
router.use("/comments", commentsRouter);
router.use("/users", usersRouter);
router.use("/settings", settingsRouter);

module.exports = router;
