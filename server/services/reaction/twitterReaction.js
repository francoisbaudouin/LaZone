require('dotenv').config();
const { TwitterApi } = require('twitter-api-v2');


var sendTweet = async function (area, resultData) {
  try {
    // var tokens = area.tokens.reaction.split(' ');
    const client = new TwitterApi(area.tokens.reaction);
    await resultData.map(async (element) => {
      await client.v2.tweet(`New ${area.actionName}\n ${element.name}\n${element.htmlUrl}`);
    });
  } catch (error) {
    console.error(error);
  }
}

module.exports = { sendTweet };