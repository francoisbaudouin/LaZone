const express = require("express");
const storage = require('node-sessionstorage')
const passport = require("passport");
const router = express.Router();

router.get('/Twitter', passport.authenticate('twitter'));

router.post('/Twitter', (req, res) => {
  try {
    storage.removeItem('userId');
    storage.setItem('userId', req.body.userId);
    res.status(201).json({message:'success'});
  } catch (error) {
    res.status(400).json({error: error});
  }
});

router.get('/Twitter/callback', 
passport.authenticate('twitter', { failureRedirect: '/' }), (req, res) => {
    if (err) throw new Error(err);
    return res.redirect('http://localhost:8080/auth/success');
});

module.exports = router;

