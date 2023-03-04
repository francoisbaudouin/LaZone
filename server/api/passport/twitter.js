const passport = require('passport');
const TwitterStrategy = require('@superfaceai/passport-twitter-oauth2').Strategy;
const storage = require('node-sessionstorage')
const { PrismaClient } = require("@prisma/client");
require("dotenv").config();

const prisma = new PrismaClient();

passport.use(new TwitterStrategy({
      clientID: process.env.TWITTER_CLIENT_ID,
      clientSecret: process.env.TWITTER_CLIENT_SECRET,
      clientType: 'confidential',
      callbackURL: 'http://localhost:8080/auth/Twitter/callback',
    },
    async function(accessToken, refreshToken, profile, done) {
      try {
        await prisma.tokens.create({
          data: {
            accessTokens: accessToken,
            refreshTokens: refreshToken ? refreshToken : 'NoRefreshToken',
            relatedServiceName: 'Twitter',
            userId: Number(storage.getItem('userId')),
          }
        })
        return done(null, profile);
      } catch (err) {
        return done(null, err);
      }
    })
);