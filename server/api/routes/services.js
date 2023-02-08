const express = require("express");
const router = express.Router();
const serviceController = require('../controllers/services.js');

// services routes.
router.get("/", serviceController.getAllServices);

router.get("/:name", serviceController.getServiceByName);

router.get("/:name/actions", serviceController.getServiceActions);

router.get("/:name/reactions", serviceController.getServiceReactions);

router.get("/:name/tokens", serviceController.getServiceTokens);

module.exports = router;
