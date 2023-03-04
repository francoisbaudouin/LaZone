const express = require("express");
const router = express.Router();
const serviceController = require('../controllers/services.js');

// services routes.
router.get("/", serviceController.resGetAllServices);

router.get("/:name", serviceController.resGetServiceByName);

router.get("/:name/actions", serviceController.resGetServiceActions);

router.get("/:name/reactions", serviceController.resGetServiceReactions);

router.get("/:name/tokens", serviceController.resGetServiceTokens);

router.post("/parameters", serviceController.resPostServiceParameters);

module.exports = router;
