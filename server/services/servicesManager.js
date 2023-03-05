const { getFromRepo, getNewRepos } = require("./action/githubAction.js");
const { newPlaylist, newLikedVideo, newActivity } = require("./action/youtubeAction.js");
const { getNewPosts, getNewAlbum } = require("./action/facebookAction.js");

const { sendMessage, createChannel, client } = require("./reaction/discordReaction.js");

const { sendTweet } = require("./reaction/twitterReaction.js")

const { updateAreaTimestamp } = require("../api/controllers/areas.js");
const { getUserTokenFromService } = require("../api/controllers/users.js");

const { serviceInit } = require('./servicesInitialisation.js');

const actionMap = new Map([
  [1, getFromRepo],
  [2, getNewRepos],
  [3, getFromRepo],
  [4, getNewPosts],
  [5, getNewAlbum],
  [6, newLikedVideo],
  [7, newPlaylist],
  [8, newActivity],

]);

const reactionMap = new Map([
  [1, sendMessage],
  [2, createChannel],
  [3, createChannel],
  [5, sendTweet],
]);

async function activateArea(area) {
  await actionMap.get(area.actionId)(reactionMap.get(area.reactionId), area);
}

async function activateAreasFromUser(users) {
  if (users) {
    users.forEach(user => {
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
      })
    });
  }
}

async function getServiceData(serviceName, userId) {
  try {
    var userData = {
      id: userId,
      token: getUserTokenFromService(serviceName, userId)
    };

    if (serviceName == "Discord") {
      return (serviceInit[serviceName](client, userData))
    } else
      return (serviceInit[serviceName](userData));
  } catch (error) {
    console.error(error);
  }
}

module.exports = { activateAreasFromUser, getServiceData, client }
