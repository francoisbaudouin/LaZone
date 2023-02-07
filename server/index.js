const express = require("express");
const app = express();
const cors = require("cors");
const about_json = require('./about.json')
const PORT = process.env.PORT || 8080;
const localAuthRouter = require('./api/routes/auth/local_auth.js');
const gitAuthRouter = require('./api/routes/auth/git_auth.js');
const discordAuthRouter = require('./api/routes/auth/discord_auth.js');
const areasRouter = require('./api/routes/areas.js');
const usersRouter = require('./api/routes/users.js');
const actionsRouter = require('./api/routes/actions.js');
const reactionsRouter = require('./api/routes/reactions.js');
const servicesRouter = require('./api/routes/services.js');
const tokensRouter = require('./api/routes/tokens.js');
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

//routes - auth
app.use('/auth', localAuthRouter);
app.use('/auth', gitAuthRouter);
app.use('/auth', discordAuthRouter);
app.use('/areas', areasRouter);
app.use('/users', usersRouter);
app.use('/actions', actionsRouter);
app.use('/reactions', reactionsRouter);
app.use('/services', servicesRouter);
app.use('/tokens', tokensRouter);

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

//const configdb = require("./api/utils/basicConfig.js");

//configdb()

const userController = require('./api/controllers/users');

const services = require("./services/servicesManager.js");

async function serviceInterval() {
  const users = await userController.getAllUsers2();
    if (users) {
        users.forEach(async element => {
            const values = await userController.getUserModel(element.id);
            services.activateAreasFromUser(values);
        });
    }
}

services.client.on('ready', async client => {
  await setInterval(serviceInterval, 5000);
});

