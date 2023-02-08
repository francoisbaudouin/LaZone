const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

// tokens controllers.
exports.getAllTokens = async (req, res) => {
  const tokens = await prisma.tokens.findMany();
  res.json(tokens);
};

exports.getTokensByUserId = async (req, res) => {
  const userTokens = await prisma.tokens.findMany({
    where: {
      userId:  Number(req.params.userId)
    }
  })
  res.json(userTokens);
};

exports.getTokensByServiceName = async (req, res) => {
  const serviceTokens = await prisma.tokens.findMany({
    where: {
      relatedServiceName: req.params.serviceName
    }
  })
  res.json(serviceTokens);
};
