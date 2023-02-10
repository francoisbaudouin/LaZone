const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

// tokens controllers.
exports.resGetAllTokens = async (req, res) => {
  const tokens = await this.getAllTokens();
  res.json(tokens);
};

exports.resGetTokensByUserId = async (req, res) => {
  const userTokens = await this.getTokensByUserId(req.params.userId);
  res.json(userTokens);
};

exports.resGetTokensByServiceName = async (req, res) => {
  const serviceTokens = await this.getTokensByServiceName(req.params.serviceName);
  res.json(serviceTokens);
};

// tokens function retrieve datas
exports.getAllTokens = async () => {
  const tokens = await prisma.tokens.findMany();
  return(tokens);
};

exports.getTokensByUserId = async (userId) => {
  const userTokens = await prisma.tokens.findMany({
    where: {
      userId:  Number(userId)
    }
  })
  return(userTokens);
};

exports.getTokensByServiceName = async (serviceName) => {
  const serviceTokens = await prisma.tokens.findMany({
    where: {
      relatedServiceName: serviceName
    }
  })
  return(serviceTokens);
};
