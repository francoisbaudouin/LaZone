const { PrismaClient } = require("@prisma/client");
const express = require("express");
const storage = require('node-sessionstorage')
const passport = require("passport");
const router = express.Router();
const userController = require('../../controllers/users.js')
const prisma = new PrismaClient();

// github login

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

router.get('/Microsoft/success', async (req, res) => {
  try {
    if (storage.getItem('microsoftUserId')) {
      const user = await userController.getUserById(Number(storage.getItem('microsoftUserId')));
      console.log(user);
      if (user) {
        res.status(201).json({
          status: "success",
          data: {
            message: "Welcome back.",
            user,
          },
          statusCode: res.statusCode
        })
      } else {
        res.status(400).json({message:'error: no user'});
      }
    }
  } catch (error) {
    res.status(400).json({error: error});
  }
});

router.get('/Microsoft/callback', (req, res, next) => {
  passport.authenticate('microsoft', { failureRedirect: 'http://localhost:8080/auth/failure', successRedirect: 'http://localhost:8080/auth/success' }, (err, user, info) => {4
    try {

      if (err) throw new Error(err);
      if (!user) { return res.json({message: "Error, cannot retrieve Microsoft User."}) };
      storage.setItem('microsoftUserId', user.id);
      return res.redirect('http://localhost:8080/auth/success');
    } catch (error) {
      console.log(error);
      res.redirect('http://localhost:8080/auth/failure')
    }
  }) (req, res, next);
});

module.exports = router;

