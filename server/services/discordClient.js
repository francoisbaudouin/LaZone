require('dotenv').config();

const { Client, GatewayIntentBits, Events, EmbedBuilder } = require('discord.js');

const discordClient = new Client({
    intents: [
        GatewayIntentBits.Guilds,
        GatewayIntentBits.GuildMessages,
        GatewayIntentBits.MessageContent,
        GatewayIntentBits.GuildMembers,
    ],
});

discordClient.once(Events.ClientReady, client => {
    console.log(`Welcome at board captain, ${client.user.tag} is online`);
});

discordClient.login(process.env.discordBotToken);

// 1067077985213100134

module.exports = { discordClient, EmbedBuilder };