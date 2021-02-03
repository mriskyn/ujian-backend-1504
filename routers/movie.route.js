const express = require("express");
const router = express.Router();

const {verifyToken} = require('../helpers/jwt')

const {
  add,
  edit,
  getMovie,
  getMovies,
  set,
} = require("../controllers/MovieController");

router.get("/", (req, res) => res.json("Movie"));
router.get("/get/all", getMovies);
router.get("/get", getMovie);

router.post("/add", add);

router.use(verifyToken);

router.patch("/edit/:id", edit);
router.patch("/set/:id", set);

module.exports = router;
