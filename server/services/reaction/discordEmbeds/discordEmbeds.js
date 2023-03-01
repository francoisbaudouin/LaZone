const { EmbedBuilder } = require("../discordClient.js");

function githubPulls(pullData) {
  try {
    const embed = new EmbedBuilder()
      .setTitle(`New PullRequest ${pullData.name}`)
      .setURL(pullData.htmlUrl).setTimestamp()
      .setFooter({ text: "test" });
    return (embed);
  } catch (error) {
    console.error(error);
  }
}

function githubIssues(issueData) {
  try {
    const embed = new EmbedBuilder()
      .setTitle(`New Issue ${issueData.name}`)
      .setURL(issueData.htmlUrl).setTimestamp()
      .setFooter({ text: 'test' });
    return (embed);
  } catch (error) {
    console.error(error);
  }
}

function githubRepo(repoData) {
  try {
    const embed = new EmbedBuilder().setTitle(`New Repo ${repoData.name}`)
      .setURL(repoData.htmlUrl).setTimestamp()
      .setFooter({ text: "test" });
    return (embed);
  } catch (error) {
    console.error(error);
  }
}

function facebookPost(repoData) {
  try {
    const embed = new EmbedBuilder().setTitle(`new facebook post`)
      .setURL(repoData.htmlUrl).setTimestamp()
      .setDescription(repoData.message)
      .setFooter({ text: "test" });
    return (embed);
  } catch (error) {
    console.error(error);
  }
}

function facebookNewAlbum(repoData) {
  try {
    const embed = new EmbedBuilder().setTitle(`new facebook album: ${repoData.name}`)
    .setURL(repoData.htmlUrl).setTimestamp()
    .setFooter({ text: "test" });
    return (embed);
  } catch (error) {
    console.error(error);
  }
}

const embeds = new Map([
  [1, githubIssues],
  [2, githubPulls],
  [3, githubRepo],
  [4, facebookPost],
  [5, facebookNewAlbum],
])

module.exports = { embeds }