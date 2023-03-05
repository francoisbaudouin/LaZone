const { initDiscord, client } = require("./discordClient.js");
const { embeds } = require("./discordEmbeds/discordEmbeds.js");
const DiscordOauth2 = require("discord-oauth2");

const oauth = new DiscordOauth2();

var sendMessage = function (area, resultData) {
  try {
    const channel = client.channels.cache.get(area.reactionParam);
    resultData.forEach(element => {
      const embedMessage = embeds.get(area.actionId)(element);
      channel.send({ embeds: [embedMessage] });
    });
  } catch (error) {
    console.error(error);
  }
}

var createChannel = function (area, resultData) {
  try {
    var guild = client.guilds.cache.get(area.reactionParam)
    resultData.forEach(element => {
      const type = (area.reactionId == 3 ? 0 : 4) // choose between a text (0) or a category (4) channel
      guild.channels.create({
        name: element.name,
        type: type
      }).then((channel) => {
        if (type == 0)
          channel.send('first')
      });
    });
  } catch (error) {
    console.error(error);
  }
}

var sendPrivateMessage = async function (area, resultData) {
  try {
    const user = await client.users.fetch(
      (await oauth.getUser(area.tokens.reaction)).id
    );
    resultData.forEach(element => {
      const embedMessage = embeds.get(area.actionId)(element);
      user.send({embeds: [embedMessage]});
    });
  } catch (error) {
    console.error(error);
  }
}

module.exports = { sendMessage, createChannel, sendPrivateMessage, initDiscord, client }