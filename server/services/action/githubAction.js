require('dotenv').config();

const { Octokit } = require('octokit');

var getFromRepo = async function (callback, area) {
  const octokit = new Octokit({ auth: area.tokens.action });
  const type = (area.actionId == 1 ? "issues" : "pulls")
  var resultData = await octokit.paginate(`GET /repos/${area.actionParam}/${type}`, {
  },
    (response) => response.data.map((result) => {
      if (result.created_at > area.timestamp && !result.hasOwnProperty("pull_request"))
        return (result);
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
