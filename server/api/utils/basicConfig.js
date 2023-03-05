const { PrismaClient } = require("@prisma/client");
require("dotenv").config();
const utils = require('./utils.js')

// Initialize a prisma client
const prisma = new PrismaClient();

async function basicConfig() {
  //SERVICES
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
  await prisma.services.create({
    data: {
      name: "Google",
      description: "This is Google service",
    }
  })
  await prisma.services.create({
    data: {
      name: "Facebook",
      description: "This is Facebook service",
    }
  })
  await prisma.services.create({
    data: {
      name: "Reddit",
      description: "This is Reddit service",
    }
  })
  //ACTION

  //git
  await prisma.actions.create({
    data: {
      name: "issue",
      description: "new issue occured",
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
  await prisma.actions.create({
    data: {
      name: "pull-request",
      description: "pull request occured",
      serviceName: "Github"
    }
  })

  //Facebook
  await prisma.actions.create({
    data: {
      name: "new post",
      description: "facebook post occured",
      serviceName: "Facebook"
    }
  })
  await prisma.actions.create({
    data: {
      name: "new album",
      description: "facebook album created",
      serviceName: "Facebook"
    }
  })

  //youtube
  await prisma.actions.create({
    data: {
      id: 6,
      name: "new-like",
      description: "new video in my likes playlist",
      serviceName: "Google"
    }
  })
  await prisma.actions.create({
    data: {
      id: 7,
      name: "new-playlist",
      description: "i created a new playlist",
      serviceName: "Google"
    }
  })
  await prisma.actions.create({
    data: {
      id: 8,
      name: "new-activity",
      description: "new activity",
      serviceName: "Google"
    }
  })

  //REACTION
  
  //discord
  await prisma.reactions.create({
    data: {
      name: "DiscordMessage",
      description: "discord message reaction",
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
      name: "DiscordChannel",
      description: "create a channel",
      serviceName: "Discord"
    }
  })

  //Twitter
  await prisma.reactions.create({
    data: {
      id: 5,
      name: "TwitterTweet",
      description: "tweet something",
      serviceName: "Twitter"
    }
  })
}



module.exports = basicConfig;