const express = require("express");
const router = express.Router();
const areasController = require('../controllers/areas.js')

// areas routes.

// get
router.get("/", areasController.getAllAreas);

router.get("/enabled", areasController.getAllEnabledAreas);

router.get("/:id", areasController.getAreaById);

router.get("/:id/user", areasController.getAreaByIdRelatedUser);

// post

router.post("/new", areasController.postNewArea);


module.exports = router;
