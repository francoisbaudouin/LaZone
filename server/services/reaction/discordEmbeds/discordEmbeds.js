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

function youtubeNewPlaylist(repoData) {
  try {
    const embed = new EmbedBuilder().setTitle(`New playlist on your youtube channel: ${repoData.name}`)
      .setURL(repoData.htmlUrl).setTimestamp()
      .setFooter({ text: "test" });
    return (embed);
  } catch (error) {
    console.error(error);
  }
}

function youtubeNewLikedVideo(repoData) {
  try {
    const embed = new EmbedBuilder().setTitle(`you liked a video: ${repoData.name}`)
      .setURL(repoData.htmlUrl).setTimestamp()
      .setFooter({ text: "test" });
    return (embed);
  } catch (error) {
    console.error(error);
  }
}

function youtubeNewActivity(repoData) {
  try {
    const embed = new EmbedBuilder().setTitle(`Activity detected: ${repoData.name}`)
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
  [6, youtubeNewPlaylist],
  [7, youtubeNewLikedVideo],
  [8, youtubeNewActivity]
])

module.exports = { embeds }