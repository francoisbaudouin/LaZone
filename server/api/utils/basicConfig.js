const { PrismaClient } = require("@prisma/client");
const { Strategy } = require("passport-local");
const { hash, compare } = require("../utils/utils");
const passport = require("passport");
require("dotenv").config();

// Initialize a prisma client
const prisma = new PrismaClient();

async function basicConfig() {
  await prisma.users.create({
    data: {
      email: "test@testmail.com",
      password: await hash("password"),
      lastname: "test",
      firstname: "Tets",
      pseudo: "mypseudo",
    }
  })

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

  await prisma.tokens.create({
    data: {
      accessTokens: process.env.DISCORD_BOT_TOKEN,
      refreshTokens: "Discord refreshTokens",
      relatedServiceName: "Discord",
      userId: 1
    }
  })
  await prisma.tokens.create({
    data: {
      accessTokens: process.env.GIT_TOKEN,
      refreshTokens: "Github refreshTokens",
      relatedServiceName: "Github",
      userId: 1
    }
  })

  await prisma.actions.create({
    data: {
      name: "new issue",
      description: "new issue occured",
      serviceName: "Github"
    }
  })
  await prisma.actions.create({
    data: {
      name: "pull request",
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

  await prisma.areas.create({
    data: {
      userId: 1,
      actionsId: 1,
      reactionsId: 1,
      enabled: true,
      actionsParams: "UgoBoulestreau/POC-nodejs",
      reactionsParams: "1067077985213100134"
    }
  })
  await prisma.areas.create({
    data: {
      userId: 1,
      actionsId: 2,
      reactionsId: 3,
      enabled: true,
      actionsParams: "UgoBoulestreau/POC-nodejs",
      reactionsParams: "693113343153537035"
    }
  })
  await prisma.areas.create({
    data: {
      userId: 1,
      actionsId: 3,
      reactionsId: 2,
      enabled: true,
      actionsParams: "UgoBoulestreau/POC-nodejs",
      reactionsParams: "693113343153537035"
    }
  })
  await prisma.areas.create({
    data: {
      userId: 1,
      actionsId: 1,
      reactionsId: 2,
      enabled: true,
      actionsParams: "UgoBoulestreau/POC-nodejs",
      reactionsParams: "693113343153537035"
    }
  })
}

module.exports = basicConfig;