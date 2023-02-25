require('dotenv').config();
const tokenController = require("../../api/controllers/tokens.js")

const { Client, GatewayIntentBits, Events, EmbedBuilder } = require('discord.js');

const client = new Client({
  intents: [
    GatewayIntentBits.Guilds,
    GatewayIntentBits.GuildMessages,
    GatewayIntentBits.MessageContent,
    GatewayIntentBits.GuildMembers,
  ],
});

async function logDiscord() {
  const GitTokens = (await tokenController.getTokensByServiceName("Discord")).at(0)["accessTokens"];
  client.once(Events.ClientReady, client => {
    console.log(`Welcome aboard captain, ${client.user.tag} is online`);
  });
  client.login(GitTokens);
}

try {
  logDiscord()
} catch (error) {
  console.error(error);
}

module.exports = { client, EmbedBuilder };
