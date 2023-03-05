
//Github
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

//Facebook
function parseFacebookPost(data) {
  if (data == undefined)
    throw Error;
  var result = {
    type: "new post",
    name: data.message,
    htmlUrl: data.permalink_url,
    owner: {
      name: data.from.name,
      htmlUrl: "",
      avatarUrl: "",
    }
  }
  return (result);
}

function parseFacebookNewAlbum(data) {
  if (data == undefined)
    throw Error;
  var result = {
    type: "new album",
    name: data.name,
    htmlUrl: data.link,
    owner: {
      name: data.from.name,
      htmlUrl: "",
      avatarUrl: "",
    }
  }
  return (result);
}


//Youtube
function newYoutubeLike(data) {
  if (data == undefined)
    throw Error;
  var result = {
    type: "new-like",
    name: data.title,
    htmlUrl: 'https://www.youtube.com/watch?v=' + data.resourceId.videoId,
    owner: {
      name: '',
      htmlUrl: '',
      avatarUrl: ''
    }
  }
  return(result);
}

function newYoutubePlaylist(data) {
  if (data == undefined)
    throw Error;
  var result = {
    type: "new-playlist",
    name: data.title,
    htmlUrl: 'https://www.youtube.com/channel/' + data.channelId,
    owner: {
      name: '',
      htmlUrl: '',
      avatarUrl: ''
    }
  }
  return (result);
}

function newYoutubeActivity(data) {
  if (data == undefined)
    throw Error;
  var result = {
    type: "new-activity",
    name: data.type,
    htmlUrl: '',
    owner: {
      name: '',
      htmlUrl: '',
      avatarUrl: ''
    }
  }
  return (result);
}

const dataParsers = new Map([
  [1, parseGitIssues],
  [2, parseGitRepos],
  [3, parseGitPulls],
  [4, parseFacebookPost],
  [5, parseFacebookNewAlbum],
  [6, newYoutubeLike],
  [7, newYoutubePlaylist],
  [8, newYoutubeActivity],
])

function parseData(actionId, data) {
  var result = data.map(extract => {
    return (dataParsers.get(actionId)(extract));
  });
  return (result);
}

module.exports = { parseData }