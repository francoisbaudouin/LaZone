const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

// users controllers.
exports.getAllUsers = async (req, res) => {
  const users = await prisma.users.findMany();
  res.json(users);
};

exports.getUserById = async (req, res) => {
  const user = await prisma.users.findUnique({
    where: {
      id:  Number(req.params.id)
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
