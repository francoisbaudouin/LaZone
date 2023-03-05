const snoowrap = require('snoowrap');

var postOnSubReddit = async function (area, resultData) {
  try {
    const reddit = new snoowrap({
      userAgent: 'MyApp/1.0.0',
      clientId: process.env.REDDIT_CLIENT_ID,
      clientSecret: process.env.REDDIT_CLIENT_SECRET,
      accessToken: area.tokens.reaction
    });

    for (var data of resultData) {
      await (await reddit.getSubreddit(area.reactionParam)).submitSelfpost({
        title: `New ${data.type} ${data.name}`,
        text: data.htmlUrl
      });
    }

  } catch (error) {
    console.error(error);
  }
}

module.exports = { postOnSubReddit }