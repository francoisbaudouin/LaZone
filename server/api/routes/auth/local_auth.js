const express = require("express");
const storage = require('node-sessionstorage')
const passport = require("passport");
const { generateToken } = require("../../utils/utils.js");
const router = express.Router();

// post a user
router.get("/success", (req, res) => {
  res.status(201).send("Success, you can close this tab");
})

router.get("/failure", (req, res) => {
  res.status(400).send("Oops, something went wrong, close this tab and retry !");
})

router.post("/signUp", (req, res, next) => {
  passport.authenticate('signUp', { session: false }, (err, user, info) => {
    if (err) {
      throw new Error(err);
    }
    if (user == false) {
      return res.status(400).json({
        status: "failure",
        data: {
          info
        },
        statusCode: res.statusCode
      })
    }
    storage.setItem('userId', user.id);
    const token = generateToken(user.id);
    return res.status(201).json({
      status: "sucess",
      data: {
        message: 'Account is created with cred',
        user,
        token,
      },
      statusCode: res.statusCode
    })
  })(req, res, next);
});

router.post('/signIn', (req, res, next) => {
  passport.authenticate('signIn', { session: false }, (err, user, info) => {
    if (err) throw new Error(err);
    if (!user) { return res.json(info) };
    const token = generateToken(user.id);
    storage.setItem('userId', user.id);
    return res.status(201).json({
      status: "success",
      data: {
        message: "Welcome back.",
        user,
        token,
      },
      statusCode: res.statusCode
    });
  })(req, res, next);
});

module.exports = router;

