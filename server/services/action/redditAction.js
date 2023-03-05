const snoowrap = require('snoowrap');
const { parseData } = require('../reaction/parser/dataParser');

var getFromSubReddit = async function (callback, area) {
  try {
    const reddit = new snoowrap({
      userAgent: 'MyApp/1.0.0',
      accessToken: area.tokens.action
    });

    var tmpTimestamp = area.timestamp;
    var intTimestamp = Math.floor(new Date(tmpTimestamp).getTime() / 1000);
    var result = []

    await reddit.getSubreddit(area.actionParam).getNew({ after: area.timestamp }).then(posts => {
      result = posts.filter(post => post.created > intTimestamp);
    });

    for (var sub of result) {
      var timestamp = new Date(sub.created * 1e3).toISOString();
      if (timestamp > tmpTimestamp)
        tmpTimestamp = timestamp
    }
    area.timestamp = tmpTimestamp;
    if (result.length > 0) {
      console.log("new subReddit post triggered");
      callback(area, parseData(area.actionId, result));
    }
  } catch (error) {
    console.error(error);
  }
}

module.exports = { getFromSubReddit }