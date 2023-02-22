const { client } = require("./discordClient.js");
const { embeds } = require("./discordEmbeds/discordEmbeds.js")

var sendMessage = function (area, resultData) {
    const channel = client.channels.cache.get(area.reactionParam);
    resultData.forEach(element => {
        const embedMessage = embeds.get(area.actionId)(element);
        // console.log(embedMessage)
        channel.send({ embeds: [embedMessage] });
    });
}

var createChannel = function (area, resultData) {
  const type = (area.actionId == 3 ? 0 : 4) // choose between a text (1) or a category (4) channel
  client.guilds.cache.get(area.reactionParam).channels.create({
    name: resultData.name,
    type: type
  }).then((channel) => {
    channel.send('first')
  });
}

module.exports = { sendMessage, createChannel, client }