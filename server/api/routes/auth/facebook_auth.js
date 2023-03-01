const { PrismaClient } = require("@prisma/client");
const express = require("express");
const storage = require('node-sessionstorage')
const passport = require("passport");
const router = express.Router();
const prisma = new PrismaClient();

// github login

router.get('/Facebook', passport.authenticate('facebook', {
  scope: ['email', 'user_location', 'user_likes','user_posts', 'user_photos']
}));

router.post('/Facebook', (req, res) => {
  try {
    storage.removeItem('userId');
    storage.setItem('userId', req.body.userId);
    res.status(201).json({message:'success'});
  } catch (error) {
    res.status(400).json({error: error});
  }
});

router.get('/Facebook/callback', (req, res, next) => {
  passport.authenticate('facebook', { failureRedirect: '/', successRedirect: 'http://localhost:8080/auth/success' }, (err, user, info) => {
    if (err) throw new Error(err);
    if (!user) { return res.json({message: "Error, cannot retrieve facebook User."}) };
    return res.redirect('http://localhost:8080/auth/success');
  }) (req, res, next);
});

module.exports = router;

