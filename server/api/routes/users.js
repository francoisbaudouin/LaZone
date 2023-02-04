const { PrismaClient } = require("@prisma/client");
const express = require("express");
const passport = require("passport");
const router = express.Router();
const prisma = new PrismaClient();

// users routes.
router.get("/", async (req, res) => {
  const users = await prisma.users.findMany();
  return res.json(users);
});

router.get("/:id", async (req, res) => {
  const user = await prisma.users.findUnique({
    where: {
      id:  Number(req.params.id)
    }
  })
  return res.json(user);
});

router.get("/:id/tokens", async (req, res) => {
  const user = await prisma.tokens.findMany({
    where: {
      userId: Number(req.params.id)
    }
  })
  return res.json(user);
});

router.get("/:id/tokens/:serviceId", async (req, res) => {
  const user = await prisma.tokens.findUnique({
    where: {
      userId: Number(req.params.id),
      relatedServiceId: Number(req.params.serviceId)
    }
  })
  return res.json(user);
});

module.exports = router;
