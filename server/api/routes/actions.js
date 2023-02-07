const express = require("express");
const router = express.Router();
const actionController = require('../controllers/actions')

// actions routes.
router.get("/", actionController.actionsGetAll);

router.get("/areas", actionController.actionsGetAreasWithActions);

router.get("/:id/areas", actionController.actionsGetRelatedActionAreas);

router.get("/:id", actionController.actionsGetAction);

router.get("/:id/relatedService", actionController.actionsGetActionRelatedService);

module.exports = router;
