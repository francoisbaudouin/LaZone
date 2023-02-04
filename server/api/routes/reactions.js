const { PrismaClient } = require("@prisma/client");
const express = require("express");
const router = express.Router();
const prisma = new PrismaClient();

// reactions routes.
router.get("/", async (req, res) => {
  const reactions = await prisma.reactions.findMany();
  return res.json(reactions);
});

router.get("/areas", async (req, res) => {
  const registeredAreas = await prisma.reactions.findMany({
    select: {
      areas: true
    }
  })
  return res.json(user);
});

router.get("/:id/areas", async (req, res) => {
  const reactionsAreas = await prisma.areas.findMany({
    where: {
      actionsId: Number(req.params.id)
    }
  })
  return res.json(reactionsAreas);
});

router.get("/:id", async (req, res) => {
  const reactions = await prisma.reactions.findUnique({
    where: {
      id: Number(req.params.id),
    }
  })
  return res.json(reactions);
});


router.get("/:id/relatedService", async (req, res) => {
  const service = await prisma.services.findUnique({
    where: {
      id: Number(req.params.id),
    }
  })
  return res.json(service);
});

module.exports = router;
