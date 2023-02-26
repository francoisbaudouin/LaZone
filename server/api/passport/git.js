const passport = require('passport');
const storage = require('node-sessionstorage')
const GitHubStrategy = require( 'passport-github2').Strategy;
const { PrismaClient } = require("@prisma/client");
require("dotenv").config();

// Initialize a prisma client
const prisma = new PrismaClient();

passport.use(new GitHubStrategy({
  clientID: process.env.GITHUB_CLIENT_ID,
  clientSecret: process.env.GITHUB_CLIENT_SECRET,
  callbackURL: "http://localhost:8080/auth/Github/callback"
  },
  async function(accessToken, refreshToken, profile, done) {
    try {
      await prisma.tokens.create({
        data: {
          accessTokens: accessToken,
          refreshTokens: refreshToken ? refreshToken : 'NoRefreshToken',
          relatedServiceName: 'Github',
          userId: Number(storage.getItem('userId')),
        }
      })
      return done(null, profile);
    } catch (err) {
      return done(null, err);
    }
  }
));

passport.serializeUser(function(user, done) {
  done(null, user);
});

passport.deserializeUser(function(user, done) {
  done(null, user);
});
