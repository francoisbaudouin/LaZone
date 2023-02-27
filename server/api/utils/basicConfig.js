const { PrismaClient } = require("@prisma/client");
const { Strategy } = require("passport-local");
const { hash, compare } = require("../utils/utils");
const passport = require("passport");
require("dotenv").config();

// Initialize a prisma client
const prisma = new PrismaClient();

async function basicConfig() {
  await prisma.services.create({
    data: {
      name: "Github",
      description: "This is git service",
    }
  })
  await prisma.services.create({
    data: {
      name: "Discord",
      description: "This is discord service",
    }
  })
  await prisma.services.create({
    data: {
      name: "Twitter",
      description: "This is twitter service",
    }
  })

  await prisma.actions.create({
    data: {
      name: "issue",
      description: "new issue occured",
      serviceName: "Github"
    }
  })
  await prisma.actions.create({
    data: {
      name: "pull-request",
      description: "pull request occured",
      serviceName: "Github"
    }
  })
  await prisma.actions.create({
    data: {
      name: "repo",
      description: "new repo occured",
      serviceName: "Github"
    }
  })

  await prisma.reactions.create({
    data: {
      name: "DiscordMessage",
      description: "discord message reaction",
      serviceName: "Discord"

    }
  })
  await prisma.reactions.create({
    data: {
      name: "DiscordChannel",
      description: "create a channel",
      serviceName: "Discord"
    }
  })
  await prisma.reactions.create({
    data: {
      name: "DiscordCategory",
      description: "create a category",
      serviceName: "Discord"
    }
  })
  await prisma.reactions.create({
    data: {
      name: "TwitterTweet",
      description: "create a category",
      serviceName: "Twitter"
    }
  })
}

module.exports = basicConfig;