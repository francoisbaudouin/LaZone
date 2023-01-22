const express = require("express");
const app = express();
const cors = require("cors");
const about_json = require('./about.json')
const PORT = process.env.PORT || 8080;
const authRouter = require('./api/routes/auth.routes.js');
const passport = require("passport");
const session = require("express-session");
const isLoggedIn = require('./api/utils/authorization.js');
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
  origin: "http://localhost:8080"
};

app.use(cors(corsOptions));
// parse requests of content-type - application/json
app.use(express.json());
// parse requests of content-type - application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: true }));

// Initialize passport
require("./api/passport/local.js")(passport);
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
  res.send("Hello world !");
});

//routes
app.use('/auth', authRouter);

//test route
app.get("/profile", isLoggedIn, (req, res, next) => {
  return res.json({message: "Welcome friend", user: req.user});
})

app.get('/about.json', (req, res) => {
  res.json(about_json);
})

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});
