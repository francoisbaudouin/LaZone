const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

// areas routes.

exports.postNewArea = async function (req, res) {
  var newArea = {
    create: {
      userId: req.userId,
      actionsId: req.actionId,
      actionParam: "default",
      reactionParam: "default",
      reactionsId: req.actionId,
      actionsId: req.actionId,
      enabled: req.enabled
    }
  }
  res.json(newArea);
  // console.log(newArea);
  // return newArea;
  //await prisma.areas.create(newArea);
}
