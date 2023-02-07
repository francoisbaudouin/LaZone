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

exports.postNewArea = async (req, res) => {
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
  //   status: "sucess",
  //   data: {
  //     userId: req.userId,
  //     actionParam: "default",
  //     reactionParam: "default",
  //     reactionsId: req.actionId,
  //     actionsId: req.actionId,
  //     enabled: req.enabled
  //   },
  //   statusCode: res.statusCode
  // })
  //console.log(newArea);
  // return newArea;
  //await prisma.areas.create(newArea);
}