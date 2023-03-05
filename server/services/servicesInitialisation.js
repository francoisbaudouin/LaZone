const { Octokit } = require('octokit');
const snoowrap = require('snoowrap');
const DiscordOauth2 = require("discord-oauth2");
const oauth = new DiscordOauth2();

var discordInit = async function (client, user) {
  var result = [];
  const userId = (await oauth.getUser(user.token)).id;
  for (var guild of client.guilds.cache) {
    if ((await guild[1].members.fetch()).has(userId)) {
      var server = {
        id: guild[0],
        name: guild[1].name,
        channels: []
      };
      for (var channel of guild[1].channels.cache) {
        if (channel[1].type != 0)
          continue;
        var data = {
          id: channel[0],
          name: channel[1].name
        };
        server.channels.push(data);
      }
      result.push(server);
    }
  }
  return (result);
}

const githubInit = async function (user) {
  const octokit = new Octokit({ auth: user.token })
  var result = [];

  var repos = (await octokit.rest.repos.listForAuthenticatedUser()).data;
  for (var repo of repos) {
    result.push({ name: repo.full_name })
  }

  return (result);
};

const redditInit = async function (user) {
  const reddit = new snoowrap({
    userAgent: 'MyApp/1.0.0',
    accessToken: user.token
  });
  var result;

  await reddit.getSubscriptions().then(subscriptions => {
    result = subscriptions.map(sub => sub.display_name);
  });
  return (result);
};

const serviceInit = new Map([
  ["Discord", discordInit],
  ["Github", githubInit],
  ["Reddit", redditInit]
]);

module.exports = { serviceInit }