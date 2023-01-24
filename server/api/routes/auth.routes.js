// user.routes.js - User route module.

const { PrismaClient } = require("@prisma/client");
const express = require("express");
const passport = require("passport");
const { generateToken } = require("../utils/utils.js");
const router = express.Router();
//const UserController = require("../../controllers/users.js")

const prisma = new PrismaClient();

// Home page route.
router.get("/", function (req, res) {
  async function t () {
    const y = await prisma.user.findMany();
    return  y;
  };
  const users = t();
  if (!users) {
    res.json({message: "Error"})
  }
  res.json(users);
  
});

// post a user
router.post("/signUp", (req, res, next) => {
  passport.authenticate('signUp', { session: false }, (err, user, info) => {
    if (err) {
      console.log("MAIS TU VAS PASSER LA OUAIS");
      throw new Error(err);
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

