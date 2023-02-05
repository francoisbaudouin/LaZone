const express = require("express");
const router = express.Router();
const areasController = require('../controllers/areas.js')

// areas routes.
router.get("/", areasController.getAllAreas);

router.get("/enabled", areasController.getAllEnabledAreas);

router.get("/:id", areasController.getAreaById);

router.get("/:id/user", areasController.getAreaByIdRelatedUser);

module.exports = router;
