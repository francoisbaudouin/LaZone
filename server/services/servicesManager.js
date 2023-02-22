const {getFromRepo, getNewRepos} = require("./action/githubAction.js");
const { sendMessage, createChannel, client } = require("./reaction/discordReaction.js");

const { updateAreaTimestamp } = require("../api/controllers/areas.js");

const actionMap = new Map([
  [1, getFromRepo],
  [2, getFromRepo],
  [3, getNewRepos],
]);

const reactionMap = new Map([
  [1, sendMessage],
  [2, createChannel],
]);

async function activateArea(area) {
  await actionMap.get(area.actionId)(reactionMap.get(area.reactionId), area);
}

function activateAreasFromUser(user) {
  if (user.areas) {
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
        timestamp: element.timestamp.toISOString(),
      };
      await activateArea(area)
      await updateAreaTimestamp(element.id, area.timestamp);
    });
  }
}

module.exports = { activateAreasFromUser, client }
