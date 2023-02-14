const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

// services controllers.
exports.resGetAllServices = async (req, res) => {
  const services = await this.getAllServices()
  res.json(services)
};

exports.resGetServiceByName = async (req, res) => {
  const service = await this.getServiceByName(req.params.name);
  res.json(service);
};

exports.resGetServiceActions = async (req, res) => {
  const serviceActions = await this.getServiceActions(req.params.name);
  res.json(serviceActions);
};

exports.resGetServiceReactions = async (req, res) => {
  const serviceReactions = await this.getServiceReactions(req.params.name);
  res.json(serviceReactions);
};

exports.resGetServiceTokens = async (req, res) => {
  const serviceTokens = await this.getServiceTokens(req.params.name);
  res.json(serviceTokens);
};

// service functions retrieve datas
exports.getAllServices = async () => {
  const services = await prisma.services.findMany();
  return(services);
};

exports.getServiceByName = async (serviceName) => {
  const service = await prisma.services.findUnique({
    where: {
      name: serviceName
    }
  })
  return(service);
};

exports.getServiceActions = async (serviceName) => {
  const serviceActions = await prisma.actions.findMany({
    where: {
      serviceName: serviceName
    }
  })
  return(serviceActions);
};

exports.getServiceReactions = async (serviceName) => {
  const serviceReactions = await prisma.reactions.findMany({
    where: {
      serviceName: serviceName
    }
  })
  return(serviceReactions);
};

exports.getServiceTokens = async (serviceName) => {
  const serviceTokens = await prisma.tokens.findMany({
    where: {
      relatedServiceName: serviceName
    }
  })
  return(serviceTokens);
};