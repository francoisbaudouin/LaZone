const { PrismaClient } = require("@prisma/client");
const express = require("express");
const router = express.Router();
const prisma = new PrismaClient();

// areas routes.
router.get("/", async (req, res) => {
  const areas = await prisma.areas.findMany();
  return res.json(areas);
});

router.get("/enabled", async (req, res) => {
  const enabledAreas = await prisma.areas.findMany({
    where: {
      enabled: true
    }
  })
  return res.json(enabledAreas);
});

router.get("/:id", async (req, res) => {
  const area = await prisma.areas.findUnique({
    where: {
      id: Number(req.params.id),
    }
  })
  return res.json(area);

});

router.get("/:id/user", async (req, res) => {
  const user = await prisma.users.findFirst({
    where: {
      areas: {
        some: {
          id: Number(req.params.id)
        }
      }
    }
  })
  return res.json(user);
});

router.get("/:id/user/token", async (req, res) => {
  const user = await prisma.users.findFirst({
    where: {
      areas: {
        some: {
          id: Number(req.params.id)
        }
      }
    }
  })
  return res.json(user);
});

module.exports = router;
