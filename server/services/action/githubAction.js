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

var getNewRepos = async function (callback, area) {
  var result = []
  var tmpTimestamp = area.timestamp;
  const octokit = new Octokit({ auth: area.tokens.action });
  var repos = (await octokit.rest.repos.listForAuthenticatedUser()).data;
  repos.forEach(repo => {
    repo.created_at = repo.created_at.replace(/.$/,".000" + repo.created_at.slice(-1));
    if (repo.created_at > area.timestamp) {
      result.push(repo);
      if (repo.created_at > tmpTimestamp)
        tmpTimestamp = repo.created_at;
    }
  });
  callback(area, result)
}

module.exports = { getFromRepo, getNewRepos }
