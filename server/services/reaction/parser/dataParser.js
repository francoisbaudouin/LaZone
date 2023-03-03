function parseGitIssues(data) {
  if (data == undefined)
    throw Error;
  var result = {
    type: "issue",
    name: `${data.number}:${data.title}`,
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
  if (data == undefined)
    throw Error;
  var result = {
    type: "Pull_Request",
    name: `${data.number}:${data.title}`,
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
  if (data == undefined)
    throw Error;
  var result = {
    type: "Repo",
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

function parseSubReddit(data) {
  if (data == undefined)
    throw Error;
  var result = {
    type: "Post on subReddit",
    name: data.title,
    htmlUrl: data.url,
    owner: {
      name: data.author.name,
      htmlUrl: `https://www.reddit.com/user/${data.author.name}`,
      avatarUrl: data.author.icon_img,
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