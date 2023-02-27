const passport = require('passport');
const TwitterStrategy = require('passport-twitter').Strategy;
const storage = require('node-sessionstorage')
require("dotenv").config();


passport.use(new TwitterStrategy({
  consumerKey: process.env.TWITTER_CONSUMER_KEY,
  consumerSecret: process.env.TWITTER_CONSUMER_SECRET,
  callbackURL: "http://localhost:8080/auth/twitter/callback"
},
function(token, tokenSecret, profile, cb) {
  console.log(token);
  console.log(tokenSecret);
  return cb(null, profile);
  // User.findOrCreate({ twitterId: profile.id }, function (err, user) {
  //   return cb(err, user);
  // });
}
));