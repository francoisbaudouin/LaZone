require('dotenv').config();
const { TwitterApi } = require('twitter-api-v2');

var nbTweet = 1;

var sendTweet = async function (area, resultData) {
  try {
    // var tokens = area.tokens.reaction.split(' ');
    const client = new TwitterApi(area.tokens.reaction);
    await resultData.map(async (element) => {
      try {
        await client.v2.tweet(`New ${area.actionName}\n ${element.name}\n${element.htmlUrl} Tweet ${nbTweet} triggered by area`);
        nbTweet += 1;
      } catch (err) {
        console.log(err);
      } 
    });
  } catch (error) {
    console.error(error);
  }
}

module.exports = { sendTweet };