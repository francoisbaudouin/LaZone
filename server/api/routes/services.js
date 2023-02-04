const { PrismaClient } = require("@prisma/client");
const express = require("express");
const router = express.Router();
const prisma = new PrismaClient();

// services routes.
router.get("/", async (req, res) => {
  const services = await prisma.services.findMany();
  return res.json(services);
});

router.get("/:id", async (req, res) => {
  const service = await prisma.services.findUnique({
    where: {
      id: Number(req.params.id),
    }
  })
  return res.json(service);

});

router.get("/:name/actions", async (req, res) => {
  const serviceActions = await prisma.actions.findMany({
    where: {
      serviceName: req.params.name
    }
  })
  return res.json(serviceActions);
});

router.get("/:name/reactions", async (req, res) => {
  const serviceReactions = await prisma.reactions.findMany({
    where: {
      serviceName: req.params.name
    }
  })
  return res.json(serviceReactions);
});

router.get("/:id/tokens", async (req, res) => {
  const serviceTokens = await prisma.tokens.findMany({
    where: {
      relatedServiceId: Number(req.params.id)
    }
  })
  return res.json(serviceTokens);
});

module.exports = router;
