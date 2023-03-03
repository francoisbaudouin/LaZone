const passport = require('passport');
const storage = require('node-sessionstorage')
var FacebookStrategy = require('passport-facebook').Strategy;
const { PrismaClient } = require("@prisma/client");
require("dotenv").config();

// Initialize a prisma client
const prisma = new PrismaClient();

passport.use(new FacebookStrategy({
  clientID: process.env.FACEBOOK_CLIENT_ID,
  clientSecret: process.env.FACEBOOK_CLIENT_SECRET,
  callbackURL: "http://localhost:8080/auth/Facebook/callback"
  },
  async function(accessToken, refreshToken, profile, done) {
    try {
      await prisma.tokens.create({
        data: {
          accessTokens: accessToken,
          refreshTokens: refreshToken ? refreshToken : 'NoRefreshToken',
          relatedServiceName: 'Facebook',
          userId: Number(storage.getItem('userId')),
        }
      })
      return done(null, profile);
    } catch (err) {
      return done(null, err);
    }
  }
));
