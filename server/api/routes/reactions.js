const express = require("express");
const router = express.Router();
const reactionControler = require('../controllers/reactions.js')

// reactions routes.
router.get("/", reactionControler.resGetAllReactions);

router.get("/areas", reactionControler.resGetAllAreasWithReactions);

router.get("/:id/areas", reactionControler.resGetReactionbyIdRelatedAreas);

router.get("/:id", reactionControler.resGetReactionById);

router.get("/:id/relatedService", reactionControler.resGetReactionByIdRelatedService);

module.exports = router;
