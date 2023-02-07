const { PrismaClient } = require("@prisma/client");
const { use } = require("passport");
const prisma = new PrismaClient();

// users controllers.
exports.getAllUsers = async (req, res) => {
    const users = await prisma.users.findMany();
    res.json(users);
};

exports.getUserById = async (req, res) => {
    const user = await prisma.users.findUnique({
        where: {
            id: Number(req.params.id)
        }
    })
    res.json(user);
};

exports.getUserTokens = async (req, res) => {
    const userTokens = await prisma.tokens.findMany({
        where: {
            userId: Number(req.params.id)
        }
    })
    res.json(userTokens);
};

exports.getUserTokenByServiceName = async (req, res) => {
    const userServiceTokens = await prisma.tokens.findFirst({
        where: {
            userId: Number(req.params.id),
            relatedServiceName: req.params.serviceName
        }
    })
    res.json(userServiceTokens);
};

exports.getAllUsers2 = async function () {
  const users = prisma.users.findMany({
    select: {
      id: true
    }
  });
  return users;
}

exports.getUserModel = async function (userId) {
    const userTokens = await prisma.tokens.findMany({
        where: {
            userId: Number(userId)
        }
    })
    const userAreas = await prisma.areas.findMany({
        where: {
            userId: Number(userId),
            enabled: true
        }
    })
    for (i = 0; i < userAreas.length; i++) {
        var actionService = await prisma.actions.findFirst({
            where: {
                id: userAreas[i].actionsId
            }
        })
        var reactionService = await prisma.reactions.findFirst({
            where: {
                id: userAreas[i].reactionsId
            }
        })
        userAreas[i].actionsServiceName = actionService.serviceName
        userAreas[i].reactionsServiceName = reactionService.serviceName
    }
    const userModel = {
        id: userId,
        tokens: userTokens,
        areas: userAreas
    }
    return userModel;
}
