const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

// reactions routes.
exports.getAllReactions = async (req, res) => {
  const reactions = await prisma.reactions.findMany();
  res.json(reactions);
};

exports.getAllAreasWithReactions = async (req, res) => {
  const registeredAreas = await prisma.reactions.findMany({
    select: {
      areas: true
    }
  })
  res.json(registeredAreas);
};

exports.getAreabyIdRelatedAreas = async (req, res) => {
  const reactionsAreas = await prisma.areas.findMany({
    where: {
      actionsId: Number(req.params.id)
    }
  })
  res.json(reactionsAreas);
};

exports.getReactionById = async (req, res) => {
  const reactions = await prisma.reactions.findUnique({
    where: {
      id: Number(req.params.id),
    }
  })
  res.json(reactions);
};


exports.getReactionByIdRelatedService = async (req, res) => {
  const service = await prisma.services.findFirst({
    where: {
      actions: {
        some: {
          id: Number(req.params.id)
        }
      }
    }
  })
  res.json(service);
};
