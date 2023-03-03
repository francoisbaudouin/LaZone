const { getFromRepo, getNewRepos } = require("./action/githubAction.js");
const { sendMessage, createChannel, client } = require("./reaction/discordReaction.js");

const { sendTweet } = require("./reaction/twitterReaction.js")

const { updateAreaTimestamp } = require("../api/controllers/areas.js");

const { serviceInit } = require('./servicesInitialisation.js')

const actionMap = new Map([
  [1, getFromRepo],
  [2, getFromRepo],
  [3, getNewRepos],
]);

const reactionMap = new Map([
  [1, sendMessage],
  [2, createChannel],
  [3, createChannel],
  [4, sendTweet]
]);

async function activateArea(area) {
  await actionMap.get(area.actionId)(reactionMap.get(area.reactionId), area);
}

function activateAreasFromUser(user) {
  if (user.areas.length > 0) {
    user.areas.forEach(async element => {
      const action = user.tokens.find(token => token.relatedServiceName == element.actionsServiceName)
      const reaction = user.tokens.find(token => token.relatedServiceName == element.reactionsServiceName)
      var area = {
        userId: user.id,
        tokens: {
          action: (action ? action.accessTokens : undefined),
          reaction: (reaction ? reaction.accessTokens : undefined)
        },
        actionId: element.actionsId,
        reactionId: element.reactionsId,
        actionParam: element.actionsParams,
        reactionParam: element.reactionsParams,
        actionName: element.actionsName,
        reactionName: element.reactionsName,
        timestamp: element.timestamp.toISOString(),
      };
      try {
        await activateArea(area)
        await updateAreaTimestamp(element.id, area.timestamp);
      } catch (error) {
        console.error(error);
      }
    });
  }
}

async function getServiceData(userData) {
  try {
    if (userData.service.name == "Discord") {
      return (serviceInit[userData.service.name](client, userData.user))
    } else
      return (serviceInit[userData.service.name](userData.user));
  } catch (error) {
    console.error(error);
  }
}

module.exports = { activateAreasFromUser, getServiceData, client }
