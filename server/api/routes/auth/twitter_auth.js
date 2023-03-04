const express = require("express");
const storage = require('node-sessionstorage')
const passport = require("passport");
const router = express.Router();

router.get('/Twitter', passport.authenticate('twitter', {scope: ['tweet.read', 'users.read', 'tweet.write']}));

router.post('/Twitter', (req, res) => {
  try {
    storage.removeItem('userId');
    storage.setItem('userId', req.body.userId);
    res.status(201).json({message:'success'});
  } catch (error) {
    res.status(400).json({error: error});
  }
});


router.get('/Twitter/callback', (req, res, next) => { 
  passport.authenticate('twitter', { failureRedirect: 'http://localhost:8080/auth/failure'}, (err, user, info) => {
      if (err) throw new Error(err);
      return res.redirect('http://localhost:8080/auth/success');
  }) (req, res, next);
});

module.exports = router;

