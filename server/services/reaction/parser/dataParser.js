function parseGitIssues(data) {
  var result = {
    type: "issue",
    name: `${data.number} : ${data.title}`,
    htmlUrl: data.html_url,
    owner: {
      name: data.user.login,
      htmlUrl: data.user.html_url,
      avatarUrl: data.user.avatar_url,
    }
  }
  return (result);
}

function parseGitPulls(data) {
  var result = {
    type: "Pull_Request",
    name: `${data.number} : ${data.title}`,
    htmlUrl: data.html_url,
    owner: {
      name: data.user.login,
      htmlUrl: data.user.html_url,
      avatarUrl: data.user.avatar_url,
    }
  }
  return (result);
}

function parseGitRepos(data) {
  var result = {
    type: "Pull_Request",
    name: data.name,
    htmlUrl: data.html_url,
    owner: {
      name: data.owner.login,
      htmlUrl: data.owner.html_url,
      avatarUrl: data.owner.avatar_url,
    }
  }
  return (result);
}

const dataParsers = new Map([
  [1, parseGitIssues],
  [2, parseGitPulls],
  [3, parseGitRepos],
])

function parseData(actionId, data) {
  var result = data.map(extract => {
    return (dataParsers.get(actionId)(extract));
  });
  return (result);
}

module.exports = { parseData }