const { PrismaClient } = require("@prisma/client");
const express = require("express");
const router = express.Router();
const prisma = new PrismaClient();

// actions routes.
router.get("/", async (req, res) => {
  const actions = await prisma.actions.findMany();
  return res.json(actions);
});

router.get("/areas", async (req, res) => {
  const user = await prisma.actions.findMany({
    select: {
      areas: true
    }
  })
  return res.json(user);
});

router.get("/:id/areas", async (req, res) => {
  const actionsAreas = await prisma.areas.findMany({
    where: {
      actionsId: Number(req.params.id)
    }
  })
  return res.json(actionsAreas);
});

router.get("/:id", async (req, res) => {
  const actions = await prisma.actions.findUnique({
    where: {
      id: Number(req.params.id),
    }
  })
  return res.json(actions);
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
