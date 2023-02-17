const express = require("express");
const router = express.Router();
const tokenController = require('../controllers/tokens.js')

// tokens routes.
router.get("/", tokenController.resGetAllTokens);

router.get("/user/:userId", tokenController.resGetTokensByUserId);

router.get("/service/:serviceName", tokenController.resGetTokensByServiceName);

module.exports = router;
