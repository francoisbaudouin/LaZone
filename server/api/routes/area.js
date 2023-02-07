const express = require("express");
const passport = require("passport");
const router = express.Router();
const areaController = require('../controllers/area.js')

// area routes
router.post("/new", areaController.postNewArea);

module.exports = router;

