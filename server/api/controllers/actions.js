const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

// actions controllers.
exports.actionsGetAll = async (req, res) => {
  const actions = await prisma.actions.findMany();
  res.json(actions);
};

exports.actionsGetAreasWithActions =  async (req, res) => {
  const user = await prisma.actions.findMany({
    select: {
      areas: true
    }
  })
  res.json(user);
};

exports.actionsGetRelatedActionAreas = async (req, res) => {
  const actionsAreas = await prisma.areas.findMany({
    where: {
      actionsId: Number(req.params.id)
    }
  })
  return res.json(actionsAreas);
};

exports.actionsGetAction = async (req, res) => {
  const actions = await prisma.actions.findUnique({
    where: {
      id: Number(req.params.id),
    }
  })
  return res.json(actions);
};

exports.actionsGetActionRelatedService = async (req, res) => {
  const service = await prisma.services.findFirst({
    where: {
      actions: {
        some: {
          id: Number(req.params.id)
        }
      }
    }
  })
  return res.json(service);
};
