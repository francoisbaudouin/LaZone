const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

// users controllers.
exports.resGetAllUsers = async (req, res) => {
    const users = await this.getAllUsers();
    res.json(users);
};

exports.resGetUserById = async (req, res) => {
    const user = await this.getUserById(req.params.id);
    res.json(user)
};

exports.resGetUserTokens = async (req, res) => {
    const userTokens = await this.getUserTokens(req.params.id);
    res.json(userTokens);
};

exports.resGetUserTokenByServiceName = async (req, res) => {
    const userServiceTokens = await this.getUserTokenByServiceName(req.params.id, req.params.serviceName);
    res.json(userServiceTokens);
};

// users fonction retrieve datas

exports.getAllUsers = async () => {
    const users = await prisma.users.findMany();
    return(users);
};

exports.getUserById = async (userId) => {
    const user = await prisma.users.findUnique({
        where: {
            id: Number(userId)
        }
    })
    return(user);
};

exports.getUserTokens = async (userId) => {
    const userTokens = await prisma.tokens.findMany({
        where: {
            userId: Number(userId)
        }
    })
    return(userTokens);
};

exports.getUserTokenByServiceName = async (userId, serviceName) => {
    const userServiceTokens = await prisma.tokens.findFirst({
        where: {
            userId: Number(userId),
            relatedServiceName: serviceName
        }
    })
    return(userServiceTokens);
};

// other
exports.getAllUsersIds = async function () {
  const users = await prisma.users.findMany({
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
