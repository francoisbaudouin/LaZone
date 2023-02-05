const express = require("express");
const router = express.Router();
const tokenController = require('../controllers/tokens.js')

// tokens routes.
router.get("/", tokenController.getAllTokens);

router.get("/user/:userId", tokenController.getTokensByUserId);

router.get("/service/:serviceName", tokenController.getTokensByServiceName);

module.exports = router;
