const { google } = require('googleapis');
const { parseData } = require("../reaction/parser/dataParser.js")

const oauth2Client = new google.auth.OAuth2();

var newPlaylist = async function (callback, area) {
  
  //oauth2 for google api (with youtube scope)
  oauth2Client.setCredentials({
    access_token: area.tokens.action
  });

  const youtube = google.youtube('v3');
  var itemTab = [];
  let response = await new Promise(function(resolve, reject) {
    youtube.playlists.list({
      auth: oauth2Client,
      part: 'snippet',
      mine: true,
      maxResults: 50
    }).then((res) => {
      res.data.items.map(item => {
        var publishedAt = item.snippet.publishedAt;
        publishedAt = publishedAt.slice(0,-1) + ".000Z";
        if (publishedAt > area.timestamp) {
          itemTab.push(item.snippet);
          resolve(itemTab);
        }
      })
    })
  })
  if (response.length != 0) {
    response.forEach(element => {
      area.timestamp = element.publishedAt.slice(0,-1) + ".000Z";
    });
  }
  callback(area, parseData(area.actionId, response))
}

var newLikedVideo = async function (callback, area) {
  
  //oauth2 for google api (with youtube scope)
  oauth2Client.setCredentials({
    access_token: area.tokens.action
  });

  const youtube = google.youtube('v3');
  var itemTab = [];
  let response = await new Promise(function(resolve, reject) {
    youtube.playlistItems.list({
      auth: oauth2Client,
      part: 'snippet',
      playlistId: 'LL',
      mine: true,
      maxResults: 50
    }).then((res) => {
      res.data.items.map(item => {
        var publishedAt = item.snippet.publishedAt;
        publishedAt = publishedAt.slice(0,-1) + ".000Z";
        if (publishedAt > area.timestamp) {
          itemTab.push(item.snippet);
          resolve(itemTab);
        }
      })
    })
  })
  if (response.length != 0) {
    response.forEach(element => {
      area.timestamp = element.publishedAt.slice(0,-1) + ".000Z";
    });
  }
  callback(area, parseData(area.actionId, response))
}

var newActivity = async function (callback, area) {
  
  //oauth2 for google api (with youtube scope)
  oauth2Client.setCredentials({
    access_token: area.tokens.action
  });

  const youtube = google.youtube('v3');
  var itemTab = [];
  let response = await new Promise(function(resolve, reject) {
    youtube.activities.list({
      auth: oauth2Client,
      part: 'snippet',
      mine: true,
      maxResults: 50
    }).then((res) => {
      res.data.items.map(item => {
        var publishedAt = item.snippet.publishedAt;
        publishedAt = publishedAt.slice(0,-1) + ".000Z";
        if (publishedAt > area.timestamp) {
          itemTab.push(item.snippet);
          resolve(itemTab);
        }
      })
    })
  })
  if (response.length != 0) {
    response.forEach(element => {
      if (element.publishedAt.includes('+00:00')) {
        area.timestamp = element.publishedAt.replace('+00:00', '.000Z');
      } else {
        area.timestamp = element.publishedAt.slice(0,-1) + ".000Z";
      }
    });
  }
  callback(area, parseData(area.actionId, response))
}


module.exports = { newPlaylist, newLikedVideo, newActivity };
