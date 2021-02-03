const express = require("express");
const { body } = require("express-validator");
const { verifyToken } = require("../helpers/jwt");

const router = express.Router();

const {
  activate,
  close,
  deactive,
  login,
  register,
} = require("../controllers/UserController");

const registerValidation = [
  body("username")
    .notEmpty()
    .withMessage("Username can't empty")
    .isLength({ min: 6 })
    .withMessage("Username must have 6 character"),
  body("password")
    .notEmpty()
    .withMessage("Password can't empty")
    .isLength({ min: 6 })
    .withMessage("Password must have 6 character")
    .matches(/[0-9]/)
    .withMessage("Password must include number")
    .matches(/[!@#$%^&*]/)
    .withMessage("Password must include symbol"),
  body("email").isEmail().withMessage("Invalid email"),
];

router.get("/", (req, res) => res.json("user"));

router.post("/login", login);
router.post("/register", registerValidation, register);

router.use(verifyToken);
router.patch("/activate", activate);
router.patch("/deactive", deactive);
router.patch("/close", close);

module.exports = router;
