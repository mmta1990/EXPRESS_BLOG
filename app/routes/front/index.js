const express = require("express");
const router = express.Router();

//Router
const homeRouter = require("./home");
const postRouter = require("./post");

router.use("/", homeRouter);
router.use("/", postRouter);

module.exports = router;
