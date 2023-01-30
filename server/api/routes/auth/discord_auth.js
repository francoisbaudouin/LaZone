const { PrismaClient } = require("@prisma/client");
const express = require("express");
const passport = require("passport");
const router = express.Router();
const prisma = new PrismaClient();

// discord login

router.get('/discord',
  passport.authenticate('discord'));


router.get('/discord/callback', (req, res, next) => {
  passport.authenticate('discord', { failureRedirect: '/' }, (err, user, info) => {
    if (err) throw new Error(err);
    if (!user) { return res.json({message: "Error, cannot retrieve discord User."}) };
    return res.status(201).json({
      status: "success",
      data: {
        message: "Welcome back discord user.",
        user,
        statusCode: res.statusCode
      },
    });
  }) (req, res, next);
});

module.exports = router;

