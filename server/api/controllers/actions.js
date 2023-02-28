const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

// actions controllers.
exports.resGetAll = async (req, res) => {
  const actions = await this.getAllActions(req);
  res.json(actions);
};

exports.resGetAreasWithActions =  async (req, res) => {
  const areas = await this.getAreasWithActions();
  res.json(areas);
};

exports.resGetRelatedActionAreas = async (req, res) => {
  const actions = await this.getRelatedActionAreas(req.params.id);
  res.json(actions);
};

exports.resGetAction = async (req, res) => {
  const action = await this.getActionById(req.params.id)
  res.json(action);
};

exports.resGetActionRelatedService = async (req, res) => {
  const service = await this.getActionRelatedService(req.params.id)
  res.json(service);
};

//actions retrieve datas function
exports.getActionRelatedService = async function (actionId) {
  const service  = await prisma.services.findFirst({
    where: {
      actions: {
        some: {
          id: Number(actionId)
        }
      }
    }
  });
  return (service);
}

exports.getRelatedActionAreas = async function (actionId) {
  const actionsAreas = await prisma.areas.findMany({
    where: {
      actionsId: Number(actionId)
    }
  });
  return actionsAreas;
}

exports.getAreasWithActions = async function () {
  return (
    await prisma.actions.findMany({
      select: {
        areas: true
      }
    })
  )
}

exports.getAllActions = async function (param) {
  const actions = await prisma.actions.findMany();
  return(actions);
}

exports.getActionById = async function (actionId) {
  const action = await prisma.actions.findUnique({
    where: {
      id: Number(actionId),
    }
  })
  return action;
}
