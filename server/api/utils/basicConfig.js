const { PrismaClient } = require("@prisma/client");
const { Strategy } = require("passport-local");
const { hash, compare } = require("../utils/utils");
const passport = require("passport");
require("dotenv").config();

// Initialize a prisma client
const prisma = new PrismaClient();

async function basicConfig() {
  // const user = await prisma.users.create({
  //   data: {
  //     email: "test@testmail.com",
  //     password: await hash("password"),
  //     lastname: "test",
  //     firstname: "Tets",
  //     pseudo: "mypseudo",
  //   }
  // })
  const GitService = await prisma.services.create({
    data: {
      name: "Github",
      description: "This is git service",
    }
  })
  const DiscordService = await prisma.services.create({
    data: {
      name: "Discord",
      description: "This is discord service",
    }
  })
  const DiscordToken = await prisma.tokens.create({
    data: {
      accessTokens: process.env.DISCORD_BOT_TOKEN,
      refreshTokens: "Discord refreshTokens",
      relatedServiceName: "Discord",
      userId: 1
    }
  })
  const GithubToken = await prisma.tokens.create({
    data: {
      accessTokens: process.env.GIT_TOKEN,
      refreshTokens: "Github refreshTokens",
      relatedServiceName: "Github",
      userId: 1
    }
  })
  const pullRequestAction = await prisma.actions.create({
    data: {
      name: "pull request",
      description: "pull request occured",
      serviceName: "Github"
    }
  })
  const newIssueAction = await prisma.actions.create({
    data: {
      name: "new issue",
      description: "new issue occured",
      serviceName: "Github"

    }
  })
  const newMessageReaction = await prisma.reactions.create({
    data: {
      name: "DiscordMessage",
      description: "discord message reaction",
      serviceName: "Discord"

    }
  })
  const reactReaction = await prisma.reactions.create({
    data: {
      name: "discord reaction emoji",
      description: "put an emoji",
      serviceName: "Discord"
    }
  })
  // const newAreas = await prisma.areas.create({
  //   data: {
  //     userId: 1,
  //     actionsId: 1,
  //     reactionsId: 1,
  //     enabled: true,
  //     actionsParams: "UgoBoulestreau/POC-nodejs",
  //     reactionsParams: "1072600656583594065"
  //   }
  // })
}

module.exports = basicConfig;