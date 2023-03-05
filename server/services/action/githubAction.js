require('dotenv').config();

const { Octokit } = require('octokit');

const { parseData } = require("../reaction/parser/dataParser.js")

var getFromRepo = async function (callback, area) {
  try {
    const octokit = new Octokit({ auth: area.tokens.action });
    const type = (area.actionId == 1 ? "issues" : "pulls");
    var tmpTimestamp = area.timestamp;

    var result = await octokit.paginate(`GET /repos/${area.actionParam}/${type}`, {
    },
      (response) => response.data.map((result) => {
        result.created_at = result.created_at.replace(/.$/, ".000" + result.created_at.slice(-1))
        if (result.created_at > area.timestamp && !result.hasOwnProperty("pull_request")) {
          tmpTimestamp = element.created_at;
          return (result);
        }
      })
    );
    result = result.filter(function (element) { return element !== undefined; });

    area.timestamp = tmpTimestamp;
    if (result.length > 0) {
      console.log(`new ${type} triggered`);
      callback(area, parseData(area.actionId, result));
    }
  } catch (error) {
    console.error(error);
  }
}

var getNewRepos = async function (callback, area) {
  try {
    var result = [];
    var tmpTimestamp = area.timestamp;
    const octokit = new Octokit({ auth: area.tokens.action });

    var repos = (await octokit.rest.repos.listForAuthenticatedUser()).data;
    repos.forEach(repo => {
      repo.created_at = repo.created_at.replace(/.$/, ".000" + repo.created_at.slice(-1));
      if (repo.created_at > area.timestamp) {
        result.push(repo);
        tmpTimestamp = repo.created_at;
      }
    });

    area.timestamp = tmpTimestamp;
    if (result.length > 0) {
      console.log("new repo triggered");
      callback(area, parseData(area.actionId, result));
    }
  } catch (error) {
    console.error(error);
  }
}

module.exports = { getFromRepo, getNewRepos }
