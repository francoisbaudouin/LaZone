const { PrismaClient } = require("@prisma/client");
const { Strategy } = require("passport-local");
const { hash, compare } = require("../utils/utils");
const passport = require("passport");
require("dotenv").config();

// Initialize a prisma client
const prisma = new PrismaClient();

// Set strategy options
const options = {
  emailField: "email",
  nameFiedl: "name",
  passwordField: "password",
  tokenField: "token",
  passReqToCallback: true
};

module.exports = (passport) => {
  // Passport middleware to signup users
  passport.use('signUp', new Strategy(options, async (req, email, name, password, token, cb) => {
    try {
      // Check if user found
      const existsEmail = await prisma.user.findFirst({ where: { email } });
      if (existsEmail) return cb(null, false, {message: "Email already exists.", statusCode: 400 });
      // Create the user
      const user = await prisma.user.create({
        data: {
          name: name,
          email,
          password: await hash(password),
          token: token
        }
      });
      return cb(null, user);
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
      const user = await prisma.user.findFirst({ where: { email } });
      console.log(user);
      if (!user) { return cb(null, false, { message: "No user found.", statusCode: 400 }) };
      console.log("HEY HEY");

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
}
