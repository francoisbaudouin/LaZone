const express = require("express");
const app = express();
const cors = require("cors");
const about_json = require('./about.json')
const PORT = process.env.PORT || 8080;
const localAuthRouter = require('./api/routes/auth/local_auth.js');
const gitAuthRouter = require('./api/routes/auth/git_auth.js');
const discordAuthRouter = require('./api/routes/auth/discord_auth.js');
const areaRouter = require('./api/routes/area.js');
const auth = require('./api/utils/authorization.js');
const passport = require("passport");
const session = require("express-session");
require('dotenv').config()

// initialize session
app.use(session({
  name: process.env.SESSION_NAME,
  secret: process.env.SESSION_SECRET,
  saveUninitialized: false,
  resave: false,
  cookie: { maxAge: process.env.COOKIE_EXPIRE * 24 * 24 * 60 * 1000 }
}));

var corsOptions = {
  Credentials: true
};

app.use(cors(corsOptions));
// parse requests of content-type - application/json
app.use(express.json());
// parse requests of content-type - application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: true }));

// Initialize passport
require("./api/passport/local.js");
require("./api/passport/git.js");
require("./api/passport/discord.js");

app.use(passport.initialize());
app.use(passport.session());

//cors basic config
app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept, Authorization"
  );
  if (req.method === "OPTIONS") {
    res.header("Access-Control-Allow-Methods", "PUT, POST, PATCH, DELETE, GET");
    return res.status(200).json({});
  }
  next();
});

app.get("/", (req, res) => {
  res.send("Hello world !, <a href=http://localhost:8080/auth/github> here </a> you can auth with git ! <a href=http://localhost:8080/auth/discord> here </a> you can auth with discord !");
});

//routes
app.use('/auth', localAuthRouter);
app.use('/auth', gitAuthRouter);
app.use('/auth', discordAuthRouter);
app.use('/area', areaRouter);


// protected route test
// app.get('/logged', auth, (req, res) => {
//   res.send('Successfully logged !');
// })

// logout

app.get('/logout', (req, res) => {
  req.session.destroy();
  res.redirect('/');
})

app.get('/about.json', (req, res) => {
  res.json(about_json);
})

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});
