const DiscordStrategy = require('passport-discord').Strategy;
const passport = require('passport');
require("dotenv").config();

const scopes = ['identify', 'email', 'guilds', 'guilds.join'];

passport.use(new DiscordStrategy({
  clientID: process.env.DISCORD_CLIENT_ID,
  clientSecret: process.env.DISCORD_CLIENT_SECRET,
  callbackURL: 'http://localhost:8080/auth/discord/callback',
  scope: scopes
  },
  function(accessToken, refreshToken, profile, done) {
    return done(null, profile);
}));
