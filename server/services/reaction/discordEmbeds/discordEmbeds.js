const { EmbedBuilder } = require("../discordClient.js");

function githubIssues(issueData) {
  const embed = new EmbedBuilder()
    .setTitle(`New Issue ${issueData.number}: ${issueData.title}`)
    .setURL(issueData.html_url).setTimestamp()
    .setFooter({ text: 'Some footer text here', iconURL: 'https://i.imgur.com/AfFp7pu.png' });
  return (embed);
}
function githubPulls(pullData) {
  const embed = new EmbedBuilder()
    .setTitle(`New PullRequest ${pullData.number}: ${pullData.title}`)
    .setURL(pullData.html_url).setTimestamp()
    .setFooter({ text: "test" });
  return (embed);
}

const embeds = new Map([
  [1, githubIssues],
  [2, githubPulls],
])

module.exports = { embeds }