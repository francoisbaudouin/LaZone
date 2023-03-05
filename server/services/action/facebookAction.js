require('dotenv').config();

const FB = require('fb');

const { parseData } = require("../reaction/parser/dataParser.js")

var getNewPosts = async function (callback, area) {
  try {
    let timestampTmp = area.timestamp;
    let response = await new Promise(function(resolve, reject) {
      FB.setAccessToken(area.tokens.action);
      FB.api('/me/posts', 'GET', {"fields":"message,created_time,from,permalink_url","since":`${timestampTmp}`}, function(response) {
        if (response && !response.error) {
          resolve(response);
        } else {
          reject(response.error);
        }
      });
    });
    if (response.data.length != 0) {
      console.log('new post triggered');
      response.data.forEach(element => {
        area.timestamp = element.created_time.replace("+0000", ".000Z");
      });
    }
    callback(area, parseData(area.actionId, response.data));
  } catch (error) {
    console.error(error);
  }
}

var getNewAlbum = async function (callback, area) {
  try {
    let timestampTmp = area.timestamp;
    let response = await new Promise(function(resolve, reject) {
      FB.setAccessToken(area.tokens.action);
      FB.api('/me/albums', 'GET', {"fields":"created_time,from,name,link","since":`${timestampTmp}`}, function(response) {
        if (response && !response.error) {
          resolve(response);
        } else {
          reject(response.error);
        }
      });
    });
    if (response.data.length != 0) {
      console.log('new album triggered');
      response.data.forEach(element => {
        area.timestamp = element.created_time.replace("+0000", ".000Z");
      });
    }
    callback(area, parseData(area.actionId, response.data));
  } catch (error) {
    console.error(error);
  }
}

module.exports = { getNewPosts, getNewAlbum }


