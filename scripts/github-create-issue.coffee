# Description:
#   Create issues with hubot
#
# Commands:
#   hubot new issue <content> - Create an issue on GitHub for Jarvis
#
# Author:
#   cpradio

githubot = require('githubot')

module.exports = (robot) ->
  useIdentity = process.env.HUBOT_GITHUB_IDENTITY?

  handleTokenError = (res, err) ->
    switch err.type
      when 'redis'
        res.reply "Oops: #{err}"
      when 'github user'
        res.reply "Sorry, you haven't told me your GitHub username."

  parseLabels = (rawLabels) ->
    if rawLabels then rawLabels.slice(1, -2).split(",") else rawLabels
  parseMilestone = (rawMilestone) ->
    if rawMilestone then rawMilestone.slice(3, -1) else rawMilestone
  parseBody = (rawBody) ->
    if rawBody then rawBody.slice(2).trim() else rawBody

  robot.respond /new issue ([\w\s`~!@#$%^&*()\[\]{}<>?./|"',;_+=-]+)(: (.*))?/i, (res) ->
    repo = githubot.qualified_repo process.env.HUBOT_GITHUB_REPO
    user = res.envelope.user.name
    payload = {}
    payload.title = res.match[1].trim()
    payload.body = if res.match[3] then res.match[3].trim() + "\r\n\r\n_submitted by #{user}_" else "_submitted by #{user}_"
    url  = "/repos/#{repo}/issues"

    createIssue = (github, payload) ->
      github.post url, payload, (issue) ->
        res.reply "I've opened the issue ##{issue.number} for #{user} (#{issue.html_url})"

    return createIssue(githubot(robot), payload) unless useIdentity

    robot.identity.findToken user, (err, token) ->
      if err
        handleTokenError(res, err)
      else
        createIssue(githubot(robot, token: token), payload)
