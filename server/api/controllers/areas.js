const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

// areas routes.
exports.getAllAreas = async (req, res) => {
  const areas = await prisma.areas.findMany();
  res.json(areas);
};

exports.getAllEnabledAreas = async (req, res) => {
  const enabledAreas = await prisma.areas.findMany({
    where: {
      enabled: true
    }
  })
  res.json(enabledAreas);
};

exports.getAreaById =  async (req, res) => {
  const area = await prisma.areas.findUnique({
    where: {
      id: Number(req.params.id),
    }
  })
  res.json(area);
};

exports.getAreaByIdRelatedUser =  async (req, res) => {
  const user = await prisma.users.findFirst({
    where: {
      areas: {
        some: {
          id: Number(req.params.id)
        }
      }
    }
  })
  res.json(user);
};
