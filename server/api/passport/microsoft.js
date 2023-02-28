const passport = require('passport');
const MicrosoftStrategy = require('passport-microsoft').Strategy;
const storage = require('node-sessionstorage');
const { PrismaClient } = require("@prisma/client");
require("dotenv").config();

const prisma = new PrismaClient();

passport.use(new MicrosoftStrategy({
    // Standard OAuth2 options
    clientID: process.env.MICROSOFT_CLIENT_ID,
    clientSecret: process.env.MICROSOFT_CLIENT_SECRET,
    callbackURL: "http://localhost:8080/auth/Microsoft/callback",
    scope: ['user.read'],
  },
  async function(accessToken, refreshToken, profile, done) {
    try {
      await prisma.tokens.create({
        data: {
          accessTokens: accessToken,
          refreshTokens: refreshToken ? refreshToken : 'NoRefreshToken',
          relatedServiceName: 'Microsoft',
          userId: Number(storage.getItem('userId')),
        }
      })
      return done(null, profile);
    } catch (err) {
      return done(null, err);
    }
  }
));