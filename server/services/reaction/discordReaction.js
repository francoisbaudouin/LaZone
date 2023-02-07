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

module.exports = { sendMessage, client }