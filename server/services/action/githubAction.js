require('dotenv').config();

const { Octokit } = require('octokit');

const { parseData } = require("../reaction/parser/dataParser.js")

var getFromRepo = async function (callback, area) {
  const octokit = new Octokit({ auth: area.tokens.action });
  const type = (area.actionId == 1 ? "issues" : "pulls")
  var result = await octokit.paginate(`GET /repos/${area.actionParam}/${type}`, {
  },
    (response) => response.data.map((result) => {
      result.created_at = result.created_at.replace(/.$/, ".000" + result.created_at.slice(-1))
      if (result.created_at > area.timestamp && !result.hasOwnProperty("pull_request")) {
        console.log(area.timestamp, result.created_at);
        return (result);
      }
    })
  );
  result = result.filter(function (element) { return element !== undefined; });
  result.forEach(element => {
    if (element.created_at > area.timestamp)
      area.timestamp = element.created_at;
  });
  if (result.length > 0) {
    callback(area, parseData(area.actionId, result));
  }
}

var getNewRepos = async function (callback, area) {
  var result = []
  var tmpTimestamp = area.timestamp;
  const octokit = new Octokit({ auth: area.tokens.action });
  var repos = (await octokit.rest.repos.listForAuthenticatedUser()).data;
  repos.forEach(repo => {
    repo.created_at = repo.created_at.replace(/.$/, ".000" + repo.created_at.slice(-1));
    if (repo.created_at > area.timestamp) {
      result.push(repo);
      if (repo.created_at > tmpTimestamp)
        tmpTimestamp = repo.created_at;
    }
  });
  callback(area, parseData(area.actionId, result));
}

module.exports = { getFromRepo, getNewRepos }
