require('dotenv').config();

const { Client, GatewayIntentBits, Events, EmbedBuilder } = require('discord.js');

const client = new Client({
  intents: [
    GatewayIntentBits.Guilds,
    GatewayIntentBits.GuildMessages,
    GatewayIntentBits.MessageContent,
    GatewayIntentBits.GuildMembers,
  ],
});

client.once(Events.ClientReady, client => {
  console.log(`Welcome at board captain, ${client.user.tag} is online`);
});

client.login(process.env.DISCORD_BOT_TOKEN);

// 1067077985213100134

module.exports = { client, EmbedBuilder };
