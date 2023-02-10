const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

// reactions routes.
exports.resGetAllReactions = async (req, res) => {
  const reactions = await this.getAllReactions();
  res.json(reactions);
};

exports.resGetAllAreasWithReactions = async (req, res) => {
  const registeredAreas = await this.getAllAreasWithReactions();
  res.json(registeredAreas);
};

exports.resGetReactionbyIdRelatedAreas = async (req, res) => {
  const reactionsAreas = await this.getReactionbyIdRelatedAreas(req.params.id);
  res.json(reactionsAreas);
};

exports.resGetReactionById = async (req, res) => {
  const reactions = await this.getReactionById(req.params.id);
  res.json(reactions);
};


exports.resGetReactionByIdRelatedService = async (req, res) => {
  const service = await this.getReactionByIdRelatedService(req.params.id);
  res.json(service);
};

// reactions functions retrieve datas
exports.getAllReactions = async () => {
  const reactions = await prisma.reactions.findMany();
  return(reactions);
};

exports.getAllAreasWithReactions = async () => {
  const registeredAreas = await prisma.reactions.findMany({
    select: {
      areas: true
    }
  })
  return(registeredAreas);
};

exports.getReactionbyIdRelatedAreas = async (reactionId) => {
  const reactionsAreas = await prisma.areas.findMany({
    where: {
      reactionsId: Number(reactionId)
    }
  })
  return(reactionsAreas);
};

exports.getReactionById = async (reactionId) => {
  const reactions = await prisma.reactions.findUnique({
    where: {
      id: Number(reactionId),
    }
  })
  return(reactions);
};


exports.getReactionByIdRelatedService = async (reactionId) => {
  const service = await prisma.services.findFirst({
    where: {
      reactions: {
        some: {
          id: Number(reactionId)
        }
      }
    }
  })
  return(service);
};
