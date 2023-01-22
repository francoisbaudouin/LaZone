// user.routes.js - User route module.

const express = require("express");
const passport = require("passport");
const { generateToken } = require("../utils/utils");
const router = express.Router();
//const UserController = require("../../controllers/users.js")

// Home page route.
router.get("/", function (req, res) {
  res.send("Auth home page");
});

// post a user
router.post("/signUp", (req, res, next) => {
  passport.authenticate('signUp', { session: false }, (err, user, info) => {
    if (err) throw new Error(err);
    const token = generateToken(user.id);
  })
  res.status(201).json({
    message: 'Account is created with cred',
    user: user,
    token: token,
    statusCode: res.statusCode
  }) (req, res, next);
});

router.post('/signIn', (req, res, next) => {
  passport.authenticate('signIn', { session: false }, (err, user, info) => {
    if (err) throw new Error(err);
    const token = generateToken(user.id);
    return res.status(201).json({
      status: "success",
      data: {
        message: "Welcome back.",
        user,
        token,
        statusCode: res.statusCode
      },
    });
  }) (req, res, next);
});

// all datas.
//router.get("/datas", UserController.findAll);

module.exports = router;
