const express = require("express");
const router = express.Router();
const usersController = require("../controllers/users.js");

// users routes.
router.get("/", usersController.resGetAllUsers);

router.get("/:id", usersController.resGetUserById);

router.get("/:id/tokens", usersController.resGetUserTokens);

router.get("/:id/tokens/:serviceName", usersController.resGetUserTokenByServiceName);

module.exports = router;
