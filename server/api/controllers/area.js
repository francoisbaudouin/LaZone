const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

// areas routes.

exports.postNewArea = async function (req, res) {
  var newArea = {
    data: {
      userId: req.userId,
      actionParam: "default",
      reactionParam: "default",
      reactionsId: req.actionId,
      actionsId: req.actionId,
      enabled: req.enabled
    },
    statusCode: 201,
  }

  res.status(201).json({
    status: "sucess",
    data: {
      userId: req.userId,
      actionParam: "default",
      reactionParam: "default",
      reactionsId: req.actionId,
      actionsId: req.actionId,
      enabled: req.enabled
    },
    statusCode: res.statusCode
  })
  //console.log(newArea);
  // return newArea;
  //await prisma.areas.create(newArea);
}
