const { PrismaClient } = require("@prisma/client");
const express = require("express");
const storage = require('node-sessionstorage')
const passport = require("passport");
const router = express.Router();
const prisma = new PrismaClient();

// github login

<<<<<<< HEAD
router.get('/Github', passport.authenticate('github', {scope: ['repo,user,project']}));
=======
router.get('/Github', passport.authenticate('github', { scope: [ 'user,repo,project' ] }));
>>>>>>> 4f2c53921df49abe5e4a93390689532f27623120

router.post('/Github', (req, res) => {
  try {
    storage.removeItem('userId');
    storage.setItem('userId', req.body.userId);
    res.status(201).json({message:'success'});
  } catch (error) {
    res.status(400).json({error: error});
  }
});

router.get('/Github/callback', (req, res, next) => {
  passport.authenticate('github', { failureRedirect: '/', successRedirect: 'http://localhost:8080/auth/success' }, (err, user, info) => {
    if (err) throw new Error(err);
    if (!user) { return res.json({message: "Error, cannot retrieve git User."}) };
    return res.redirect('http://localhost:8080/auth/success');
  }) (req, res, next);
});

module.exports = router;

