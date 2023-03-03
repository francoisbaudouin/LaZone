const snoowrap = require('snoowrap');
const { parseData } = require('../reaction/parser/dataParser');

var getFromSubReddit = async function (callback, area) {
  try {
    const reddit = new snoowrap({
      userAgent: 'MyApp/1.0.0',
      accessToken: area.tokens.action
    });

    const result = await reddit.getSubreddit(area.actionParam).getNew();

    if (result.length > 0)
      callback(area, parseData(area.actionId, result));
  } catch (error) {
    console.error(error);
  }
}

module.exports = { getFromSubReddit }