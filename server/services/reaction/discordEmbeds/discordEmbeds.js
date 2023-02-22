const { EmbedBuilder } = require("../discordClient.js");

function githubPulls(pullData) {
  const embed = new EmbedBuilder()
    .setTitle(`New PullRequest ${pullData.name}`)
    .setURL(pullData.htmlUrl).setTimestamp()
    .setFooter({ text: "test" });
  return (embed);
}

function githubIssues(issueData) {
  const embed = new EmbedBuilder()
    .setTitle(`New Issue ${issueData.name}`)
    .setURL(issueData.htmlUrl).setTimestamp()
    .setFooter({ text: 'test'});
  return (embed);
}

function githubRepo(repoData) {
  const embed = new EmbedBuilder().setTitle(`New Repo ${repoData.name}`)
  .setURL(repoData.htmlUrl).setTimestamp()
  .setFooter({text: "test"});
  return (embed);
}

const embeds = new Map([
  [1, githubIssues],
  [2, githubPulls],
  [3, githubRepo],
])

module.exports = { embeds }