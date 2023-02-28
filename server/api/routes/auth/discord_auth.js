const { PrismaClient } = require("@prisma/client");
const express = require("express");
const passport = require("passport");
const router = express.Router();
const prisma = new PrismaClient();

// discord login

router.get('/Discord',
  passport.authenticate('discord', { permissions: 8 }));

router.post('/Discord', (req, res) => {
  res.status(201).json({message: "success"});
})

router.get('/Discord/callback', (req, res, next) => {
  passport.authenticate('discord', { failureRedirect: '/', successRedirect: 'http://localhost:8080/auth/success' }, (err, user, info) => {
    if (err) throw new Error(err);
    return res.status(201).redirect('http://localhost:8080/auth/success');
  }) (req, res, next);
});

module.exports = router;
