var MicrosoftStrategy = require('passport-microsoft').Strategy;
const passport = require('passport');
const storage = require('node-sessionstorage')
const { PrismaClient } = require("@prisma/client");
require("dotenv").config();
const { hash, compare } = require("../utils/utils");

// Initialize a prisma client
const prisma = new PrismaClient();

passport.use(new MicrosoftStrategy({
  // Standard OAuth2 options
  clientID: process.env.MICROSOFT_CLIENT_ID,
  clientSecret: process.env.MICROSOFT_CLIENT_SECRET,
  callbackURL: "http://localhost:8080/auth/Microsoft/callback",
  scope: ['user.read'],

}, async function(accessToken, refreshToken, profile, done) {
  try {
    var user = await prisma.users.findFirst({
      where: {
        email: profile._json.mail
      }
    })
    if (!user) {
      const newUser = await prisma.users.create({
        data: {
          email: profile._json.mail,
          password: await hash('verryComplexePassword'),
          authType: 'microsoft',
          firstname: profile._json.givenName ? profile._json.givenName : 'John',
          lastname: profile._json.surname ? profile._json.surname : 'Doe',
          pseudo: profile._json.displayName ? profile._json.displayName : 'John Doe',
        }
      })
      console.log(newUser.firstname);
      return done(null, newUser);
    }
    return done(null, user);
  } catch (error) {
    return done(error , null);
  }
}
));