const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

// areas routes.
exports.resGetAllAreas = async (req, res) => {
  const areas = await this.getAllAreas();
  res.json(areas);
};

exports.resGetAllEnabledAreas = async (req, res) => {
  const enabledAreas = await this.getEnabledAreas();
  res.json(enabledAreas);
};

exports.resGetAreaById =  async (req, res) => {
  const area = await this.getAreaById(req.params.id);
  res.json(area);
};

exports.resGetAreaByIdRelatedUser =  async (req, res) => {
  const user = await this.getAreaByIdRelatedUser(req.params.id);
  res.json(user);
};

exports.resPostNewArea = async (req, res) => {
  const user = await prisma.users.findFirst({
    where: {
      id: req.body.userId
    }
  })
  const action = await prisma.actions.findFirst({
    where: {
      id: req.body.action
    }
  })
  const reaction = await prisma.reactions.findFirst({
    where: {
      id: req.body.reaction
    }
  })
  const newArea = await prisma.areas.create({
    data: {
      userId: user.id,
      actionsId: action.id,
      reactionsId: reaction.id,
      actionsParams: req.body.actionParam,
      reactionsParams: req.body.reactionParam,
      enabled: req.body.enabled      
    }
  })
  res.status(201).json({result: newArea, statusCode: res.statusCode})
}

//areas function retrieve datas
exports.getAllAreas = async () => {
  const areas = await prisma.areas.findMany();
  return areas;
}

exports.getEnabledAreas = async () => {
  const enabledAreas = await prisma.areas.findMany({
    where: {
      enabled: true
    }
  });
  return enabledAreas;
}

exports.getAreaById = async (areaId) => {
  const area = await prisma.areas.findUnique({
    where: {
      id: Number(areaId),
    }
  });
  return area;
}

exports.getAreaByIdRelatedUser = async (areaId) => {
  const user = await prisma.users.findFirst({
    where: {
      areas: {
        some: {
          id: Number(areaId)
        }
      }
    }
  }); 
  return user;
}

exports.updateAreaTimestamp = async (areaId, timestamp) => {
  await prisma.areas.update({
    where:{
      id:areaId
    },
    data: {
      timestamp: timestamp
    }
  });
};