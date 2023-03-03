const snoowrap = require('snoowrap');

var postOnSubReddit = async function (area, resultData) {
  try {
    const reddit = new snoowrap({
      userAgent: 'MyApp/1.0.0',
      accessToken: area.tokens.action
    });

    await reddit.getSubreddit(area.actionParam).submitSelfpost({
      title: `New ${resultData.type} ${resultData.name}`,
      text: resultData.htmlUrl
    });

  } catch (error) {
    console.error(error);
  }
}

module.exports = { postOnSubReddit }