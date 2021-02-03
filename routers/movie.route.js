const express = require("express");
const router = express.Router();

const {
  add,
  edit,
  getMovie,
  getMovies,
  set,
} = require("../controllers/MovieController");

router.get("/", (req, res) => res.json("Movie"));
router.get("/get/all", getMovies);
router.get("/get*", getMovie);
router.post("/add", add);
router.post("/edit/:id", edit);
router.post("/set/:id", set);

module.exports = router;
