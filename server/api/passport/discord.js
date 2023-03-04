const DiscordStrategy = require('passport-discord').Strategy;
const passport = require('passport');
const storage = require('node-sessionstorage')
const tokenController = require('../controllers/tokens.js')
require("dotenv").config();

const scopes = ['bot', 'identify'];

passport.use(new DiscordStrategy({
  clientID: process.env.DISCORD_CLIENT_ID,
  clientSecret: process.env.DISCORD_CLIENT_SECRET,
  callbackURL: 'http://localhost:8080/auth/Discord/callback',
  scope: scopes
  },
  function(accessToken, refreshToken, profile, done) {
    try {
      tokenController.postNewToken(accessToken, null, 'Discord', Number(storage.getItem('userId')));
      return done(undefined, false);
    } catch (error) {
      console.error(error);
    }
}));
