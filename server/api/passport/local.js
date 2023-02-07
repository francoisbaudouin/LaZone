const { PrismaClient } = require("@prisma/client");
const { Strategy } = require("passport-local");
const { hash, compare } = require("../utils/utils");
const passport = require("passport");
require("dotenv").config();

// Initialize a prisma client
const prisma = new PrismaClient();

// Set strategy options
const options = {
  usernameField: "email",
  passwordField: "password",
  passReqToCallback: true
};

// Passport middleware to signup users
passport.use('signUp', new Strategy(options, async (req, email, password, cb) => {
  try {
    // Check if user found
    const existsEmail = await prisma.users.findFirst({ where: { email: req.body.email } });
    if (existsEmail) return cb(null, false, { message: "Email already exists.", statusCode: 400 });
    // Create the user
    else {
      const user = await prisma.users.create({
        data: {
          email: email,
          password: await hash(password),
          lastname: req.body.lastname,
          firstname: req.body.firstname,
          pseudo: req.body.pseudo,
        }
      });
      const DiscordToken = await prisma.tokens.create({
        data: {
          accessTokens: process.env.DISCORD_BOT_TOKEN,
          refreshTokens: "Discord refreshTokens",
          relatedServiceName: "Discord",
          userId: user.id
        }
      })
      const GithubToken = await prisma.tokens.create({
        data: {
          accessTokens: process.env.GIT_TOKEN,
          refreshTokens: "Github refreshTokens",
          relatedServiceName: "Github",
          userId: user.id
        }
      })
      return cb(null, user);
    }
  } catch (err) {
    console.error(err.message);
    return cb(null, err);
  }
})
);

// Passport middleware to login users
options.passReqToCallback = false;
passport.use("signIn", new Strategy(options, async (email, password, cb) => {
  try {
    // Check if user found
    const user = await prisma.users.findFirst({ where: { email: email } });
    if (!user) { return cb(null, false, { message: "No user found.", statusCode: 400 }) };

    // Compare password
    const validPassword = await compare(password, user.password);
    if (!validPassword)
      return cb(null, false, { message: "Invalid credentials.", statusCode: 401 });

    return cb(null, user);
  } catch (err) {
    console.error(err.message);
    return cb(null, err);
  }
})
);
