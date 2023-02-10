const express = require("express");
const router = express.Router();
const actionController = require('../controllers/actions')

// actions routes.
router.get("/", actionController.resGetAll);

router.get("/areas", actionController.resGetAreasWithActions);

router.get("/:id/areas", actionController.resGetRelatedActionAreas);

router.get("/:id", actionController.resGetAction);

router.get("/:id/relatedService", actionController.resGetActionRelatedService);

module.exports = router;
