const passport = require('passport');
const storage = require('node-sessionstorage')
var GoogleStrategy = require('passport-google-oauth20').Strategy;
const { PrismaClient } = require("@prisma/client");
require("dotenv").config();

// Initialize a prisma client
const prisma = new PrismaClient();

passport.use(new GoogleStrategy({
  clientID: process.env.GOOGLE_CLIENT_ID,
  clientSecret: process.env.GOOGLE_CLIENT_SECRET,
  callbackURL: "http://localhost:8080/auth/Google/callback"
  },
  async function(accessToken, refreshToken, profile, done) {
    try {
      await prisma.tokens.create({
        data: {
          accessTokens: accessToken,
          refreshTokens: refreshToken ? refreshToken : 'NoRefreshToken',
          relatedServiceName: 'Google',
          userId: Number(storage.getItem('userId')),
        }
      })
      return done(null, profile);
    } catch (err) {
      return done(null, err);
    }
  }
));
