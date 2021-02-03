const express = require("express");
const router = express.Router();

const userRouter = require("./user.route");
const movieRouter = require("./movie.route");

router.use("/user", userRouter);
router.use("/movies", movieRouter);

module.exports = router;
