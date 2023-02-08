const express = require("express");
const router = express.Router();
const usersController = require("../controllers/users.js");

// users routes.
router.get("/", usersController.getAllUsers);

router.get("/:id", usersController.getUserById);

router.get("/:id/tokens", usersController.getUserTokens);

router.get("/:id/tokens/:serviceName", usersController.getUserTokenByServiceName);

module.exports = router;
