require('dotenv').config();

const { Octokit } = require('octokit');

var getFromRepo = async function (callback, area) {
  const octokit = new Octokit({ auth: area.tokens.action });
  const type = (area.actionId == 1 ? "issues" : "pulls")
  var resultData = await octokit.paginate(`GET /repos/${area.actionParam}/${type}`, {
  },
    (response) => response.data.map((result) => {
      result.created_at = result.created_at.replace(/.$/,".000" + result.created_at.slice(-1))
      if (result.created_at > area.timestamp && !result.hasOwnProperty("pull_request")) {
        console.log(area.timestamp, result.created_at);
        return (result);
      }
    })
  );
  resultData = resultData.filter(function (element) { return element !== undefined; });
  resultData.forEach(element => {
    if (element.created_at > area.timestamp)
      area.timestamp = element.created_at;
  });
  if (resultData.length > 0) {
    callback(area, resultData);
  }
}

module.exports = { getFromRepo }
