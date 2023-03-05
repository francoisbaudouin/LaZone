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
    return (users);
};

exports.getUserById = async (userId) => {
    const user = await prisma.users.findUnique({
        where: {
            id: Number(userId)
        }
    })
    return (user);
};

exports.getUserTokens = async (userId) => {
    const userTokens = await prisma.tokens.findMany({
        where: {
            userId: Number(userId)
        }
    })
    return (userTokens);
};

exports.getUserTokenFromService = async (serviceName, userId) => {
  const token = await prisma.tokens.findFirst({
    where: {
      userId: Number(userId),
      relatedServiceName: serviceName
    }
  })
  return (token);
};

exports.getUserTokenByServiceName = async (userId, serviceName) => {
    const userServiceTokens = await prisma.tokens.findFirst({
        where: {
            userId: Number(userId),
            relatedServiceName: serviceName
        }
    })
    return (userServiceTokens);
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

exports.getUserModel = async function (usersIds) {
    try {
        var usersModels = [];
        for (let i = 0; i < usersIds.length; i++) {
            var userAreas = [];
            const userTokens = await prisma.tokens.findMany({
                where: {
                    userId: Number(usersIds[i].id)
                }
            })
            var userAreas = await prisma.areas.findMany({
                where: {
                    userId: Number(usersIds[i].id),
                    enabled: true
                }
            })
            if (userAreas.length > 0) {
                for (let y = 0; y < userAreas.length; y++) {
                    var actionService = await prisma.actions.findFirst({
                        where: {
                            id: userAreas[y].actionsId
                        }
                    })
                    var reactionService = await prisma.reactions.findFirst({
                        where: {
                            id: userAreas[y].reactionsId
                        }
                    })
                    userAreas[y].actionsName = actionService.name;
                    userAreas[y].reactionsName = reactionService.name;
                    userAreas[y].actionsServiceName = actionService.serviceName;
                    userAreas[y].reactionsServiceName = reactionService.serviceName;
                }
                var userModel = {
                    id: Number(usersIds[i].id),
                    tokens: userTokens,
                    areas: userAreas
                }
                usersModels.push(userModel);
            }
        }
        return usersModels;
    } catch (error) {
        console.error(error);
    }
}
