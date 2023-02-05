const express = require("express");
const router = express.Router();
const reactionControler = require('../controllers/reactions.js')

// reactions routes.
router.get("/", reactionControler.getAllReactions);

router.get("/areas", reactionControler.getAllAreasWithReactions);

router.get("/:id/areas", reactionControler.getAreabyIdRelatedAreas);

router.get("/:id", reactionControler.getReactionById);

router.get("/:id/relatedService", reactionControler.getReactionByIdRelatedService);

module.exports = router;
