const express = require("express");
const storage = require('node-sessionstorage')
const passport = require("passport");
const router = express.Router();

router.get('/Microsoft', passport.authenticate('microsoft'));

router.post('/Microsoft', (req, res) => {
  try {
    storage.removeItem('userId');
    storage.setItem('userId', req.body.userId);
    res.status(201).json({message:'success'});
  } catch (error) {
    res.status(400).json({error: error});
  }
});

router.get('/Microsoft/callback', (req, res, next) => { 
  passport.authenticate('microsoft', { failureRedirect: '/'}, (err, user, info) => {
      if (err) throw new Error(err);
      return res.redirect('http://localhost:8080/auth/success');
  }) (req, res, next);
});

module.exports = router;

