// user.routes.js - User route module.

const { PrismaClient } = require("@prisma/client");
const express = require("express");
const passport = require("passport");
const { generateToken } = require("../../utils/utils.js");
const router = express.Router();
const prisma = new PrismaClient();

//const UserController = require("../../controllers/users.js")

// Home page route.
router.get("/", function (req, res) {
  async function t () {
    const y = await prisma.users.findMany();
    return y;
  };
  const users = t();
  if (!users) {
    res.json({ message: "Error" })
  }
  users.then(function (result) {
    res.json(result);
  });
});

// post a user
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
  }) (req, res, next);
});

router.post('/signIn', (req, res, next) => {
  passport.authenticate('signIn', { session: false }, (err, user, info) => {
    if (err) throw new Error(err);
    if (!user) { return res.json(info) };
    const token = generateToken(user.id);
    return res.status(201).json({
      status: "success",
      data: {
        message: "Welcome back.",
        user,
        token,
      },
      statusCode: res.statusCode
    });
  }) (req, res, next);
});

// all datas.
//router.get("/datas", UserController.findAll);

module.exports = router;

