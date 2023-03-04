require('dotenv').config();
const { TwitterApi } = require('twitter-api-v2');


var sendTweet = async function (area, resultData) {
  try {
    // var tokens = area.tokens.reaction.split(' ');
    const client = new TwitterApi({
      appKey: process.env.TWITTER_API,
      appSecret: process.env.TWITTER_API_SECRET,
      accessToken: process.env.twtTmp,
      accessSecret: process.env.twtTmpS,
    });
    await resultData.map(async (element) => {
      await client.v2.tweet(`New ${area.actionName}\n ${element.name}\n${element.htmlUrl}`);
    });
  } catch (error) {
    console.error(error);
  }
}

module.exports = { sendTweet };