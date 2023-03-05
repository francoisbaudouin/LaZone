const { PrismaClient } = require("@prisma/client");
const express = require("express");
const storage = require('node-sessionstorage')
const passport = require("passport");
const router = express.Router();
const prisma = new PrismaClient();

// github login

router.get('/Google', passport.authenticate('google', {scope: ['profile', 'https://www.googleapis.com/auth/youtube.readonly']}));

router.post('/Google', (req, res) => {
  try {
    storage.removeItem('userId');
    storage.setItem('userId', req.body.userId);
    res.status(201).json({message:'success'});
  } catch (error) {
    res.status(400).json({error: error});
  }
});

router.get('/Google/callback', (req, res, next) => {
  passport.authenticate('google', { failureRedirect: 'http://localhost:8080/auth/failure', successRedirect: 'http://localhost:8080/auth/success' }, (err, user, info) => {
    if (err) throw new Error(err);
    if (!user) { return res.json({message: "Error, cannot retrieve google User."}) };
    return res.redirect('http://localhost:8080/auth/success');
  }) (req, res, next);
});

module.exports = router;

