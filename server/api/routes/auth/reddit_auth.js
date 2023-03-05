const { PrismaClient } = require("@prisma/client");
const express = require("express");
const storage = require('node-sessionstorage')
const passport = require("passport");
const router = express.Router();
const prisma = new PrismaClient();
const tokenController = require('../../controllers/tokens.js');

const axios = require('axios');

// reddit login

const CLIENT_ID = process.env.REDDIT_CLIENT_ID;
const CLIENT_SECRET =  process.env.REDDIT_CLIENT_SECRET;
const REDIRECT_URI = 'http://localhost:8080/auth/Reddit/callback';
const STATE = 'random_string';
const authorizationUrl = `https://www.reddit.com/api/v1/authorize?client_id=${CLIENT_ID}&response_type=code&state=${STATE}&redirect_uri=${REDIRECT_URI}&duration=temporary&scope=read,submit,save`;

router.get('/Reddit', (req, res) => {
  res.redirect(authorizationUrl);
});

router.post('/Reddit', (req, res) => {
  try {
    storage.removeItem('userId');
    storage.setItem('userId', req.body.userId);
    res.status(201).json({message:'success'});
  } catch (error) {
    res.status(400).json({error: error});
  }
});

router.get('/Reddit/callback', async (req, res) => {
  const { code, state } = req.query;

  // Verify that the state parameter matches the one you provided earlier
  if (state !== STATE) {
    res.status(400).send('Invalid state parameter');
    return;
  }

  // Exchange the authorization code for an access token
  const tokenUrl = 'https://www.reddit.com/api/v1/access_token';
  const response = await axios.post(tokenUrl, {
    grant_type: 'authorization_code',
    code,
    redirect_uri: REDIRECT_URI,
  }, {
    auth: {
      username: CLIENT_ID,
      password: CLIENT_SECRET,
    },
    headers: {
      'User-Agent': 'MyApp/1.0.0', // Replace with your app's name and version
      'Content-Type': 'application/x-www-form-urlencoded',
    },
  });

  const accessToken = response.data.access_token;
  if (!accessToken) {
    res.status(400).redirect('http://localhost:8080/auth/failure')
  }
  tokenController.postNewToken(accessToken, null, 'Reddit', Number(storage.getItem('userId')));
  res.redirect('http://localhost:8080/auth/success');
})

module.exports = router;

