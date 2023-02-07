const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

// services controllers.
exports.getAllServices = async (req, res) => {
  const services = await prisma.services.findMany();
  res.json(services);
};

exports.getServiceByName = async (req, res) => {
  const service = await prisma.services.findUnique({
    where: {
      name: req.params.name
    }
  })
  res.json(service);
};

exports.getServiceActions = async (req, res) => {
  const serviceActions = await prisma.actions.findMany({
    where: {
      serviceName: req.params.name
    }
  })
  res.json(serviceActions);
};

exports.getServiceReactions = async (req, res) => {
  const serviceReactions = await prisma.reactions.findMany({
    where: {
      serviceName: req.params.name
    }
  })
  res.json(serviceReactions);
};

exports.getServiceTokens = async (req, res) => {
  const serviceTokens = await prisma.tokens.findMany({
    where: {
      relatedServiceName: req.params.name
    }
  })
  res.json(serviceTokens);
};
