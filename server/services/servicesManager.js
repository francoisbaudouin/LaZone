const githubAction = require("./action/githubAction.js");
const { sendMessage, client } = require("./reaction/discordReaction.js");

const actionMap = new Map([
  [1, githubAction.getFromRepo]
]);

const reactionMap = new Map([
  [1, sendMessage],
  [2, console.log],
]);

function activateArea(area) {
  actionMap.get(area.actionId)(reactionMap.get(area.reactionId), area);
}

function activateAreasFromUser(user) {
  user.areas.forEach(element => {
    const action = user.tokens.find(token => token.serviceName == element.action.service.name);
    const reaction = user.tokens.find(token => token.serviceName == element.reaction.service.name);
    var area = {
      userId: user.id,
      tokens: {
        action: (action ? action.token : undefined),
        reaction: (reaction ? reaction.token : undefined)
      },
      actionId: element.action.id,
      reactionId: element.reaction.id,
      actionParam: element.actionParam,
      reactionParam: element.reactionParam,
      timestamp: element.timestamp,
    };
    activateArea(area)
  });
}

module.exports = { activateAreasFromUser, client }
