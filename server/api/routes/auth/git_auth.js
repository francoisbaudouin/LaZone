const { PrismaClient } = require("@prisma/client");
const express = require("express");
const passport = require("passport");
const router = express.Router();
const prisma = new PrismaClient();

// github login

router.get('/github',
  passport.authenticate('github', { scope: [ 'user:email' ] }));

router.get('/github/callback', (req, res, next) => {
  passport.authenticate('github', { failureRedirect: '/' }, (err, user, info) => {
    if (err) throw new Error(err);
    if (!user) { return res.json({message: "Error, cannot retrieve git User."}) };
    return res.status(201).json({
      status: "success",
      data: {
        message: "Welcome back github user.",
        user,
        statusCode: res.statusCode
      },
    });
  }) (req, res, next);
});

module.exports = router;

