const express = require("express");
const router = express.Router();
const areasController = require('../controllers/areas.js')

// areas routes.

// get
router.get("/", areasController.resGetAllAreas);

router.get("/enabled", areasController.resGetAllEnabledAreas);

router.get("/:id", areasController.resGetAreaById);

router.get("/:id/user", areasController.resGetAreaByIdRelatedUser);

// post
router.post("/new", areasController.resPostNewArea);

router.post("/delete", areasController.resPostDelArea);


module.exports = router;
