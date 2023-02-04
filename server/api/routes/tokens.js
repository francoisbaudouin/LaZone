const { PrismaClient } = require("@prisma/client");
const express = require("express");
const passport = require("passport");
const router = express.Router();
const prisma = new PrismaClient();

// tokens routes.
router.get("/", async (req, res) => {
  const tokens = await prisma.tokens.findMany();
  return res.json(tokens);
});

router.get("/user/:userId", async (req, res) => {
  const token = await prisma.tokens.findFirst({
    where: {
      userId:  Number(req.params.userId)
    }
  })
  return res.json(token);
});

router.get("/service/:serviceId", async (req, res) => {
  const tokens = await prisma.tokens.findMany({
    where: {
      relatedServiceId: Number(req.params.serviceId)
    }
  })
  return res.json(tokens);
});

module.exports = router;
