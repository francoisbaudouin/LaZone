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

console.log(process.env.DISCORD_BOT_TOKEN, process.env.temp_git);
client.once(Events.ClientReady, client => {
  console.log(`Welcome aboard captain, ${client.user.tag} is online`);
});

client.login(process.env.DISCORD_BOT_TOKEN);

// 1067077985213100134

module.exports = { client, EmbedBuilder };
