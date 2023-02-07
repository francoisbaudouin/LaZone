const githubAction = require("./action/githubAction.js");
const { sendMessage, client } = require("./reaction/discordReaction.js");

const { updateAreaTimestamp } = require("../api/controllers/areas.js")

const actionMap = new Map([
  [1, githubAction.getFromRepo],
  [2, githubAction.getFromRepo],
]);

const reactionMap = new Map([
  [1, sendMessage],
  [2, console.log],
]);

async function activateArea(area) {
  await actionMap.get(area.actionId)(reactionMap.get(area.reactionId), area);
}

function activateAreasFromUser(user) {
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
    console.log(element.timestamp, area.timestamp);
    await updateAreaTimestamp(element.id, area.timestamp);
  });
}

module.exports = { activateAreasFromUser, client }
