// user.routes.js - User route module.

const express = require("express");
const router = express.Router();
//const UserController = require("../../controllers/users.js")

// Home page route.
router.get("/", function (req, res) {
  res.send("User home page");
});

// post a user
router.post("/signUp", (req, res, next) => {
  const user = {
    username: req.body.username,
    email: req.body.email,
  }
  res.status(201).json({
    message: 'Handling post request',
    createdUser: user,  
  })
})

router.get('/signIn', (req, res, next) => {
  res.send('SignIn page');
})

// all datas.
//router.get("/datas", UserController.findAll);

module.exports = router;
