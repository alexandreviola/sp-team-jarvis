# Description:
#   Manage your GitHub issues with Hubot.
#
# Commands:
#   hubot issues close #{issue number} - Close the specified issue
#   hubot issues open #{issue number} - Open the specified issue
#   hubot issues comment #{issue number} {comment} - Comment on the specified issue
#
# Author:
#   tombell
#   mattgraham

githubot = require('githubot')

module.exports = (robot) ->
  useIdentity = process.env.HUBOT_GITHUB_IDENTITY?

  handleTokenError = (res, err) ->
    switch err.type
      when 'redis'
        res.reply "Oops: #{err}"
      when 'github user'
        res.reply "Sorry, you haven't told me your GitHub username."

  robot.respond /issues close #?([0-9]+)/i, (res) ->
    nwo  = process.env.HUBOT_GITHUB_REPO
    id   = res.match[1]
    url  = "/repos/#{nwo}/issues/#{id}"
    user = res.envelope.user.name

    closeIssue = (github) ->
      github.patch url, {state: 'closed'}, (issue) ->
        res.reply "I've closed issue ##{id} for you at (#{issue.html_url})"

    return closeIssue(githubot(robot)) unless useIdentity

    robot.identity.findToken user, (err, token) ->
      if err
        handleTokenError(res, err)
      else
        closeIssue(githubot(robot, token: token))

  robot.respond /issues open #?([0-9]+)/i, (res) ->
    nwo  = process.env.HUBOT_GITHUB_REPO
    id   = res.match[1]
    url  = "/repos/#{nwo}/issues/#{id}"
    user = res.envelope.user.name

    openIssue = (github) ->
      github.patch url, {state: 'open'}, (issue) ->
        res.reply "I've opened issue ##{id} for you at (#{issue.html_url})"

    return openIssue(githubot(robot)) unless useIdentity

    robot.identity.findToken user, (err, token) ->
      if err
        handleTokenError(res, err)
      else
        openIssue(githubot(robot, token: token))

  robot.respond /issues comment #?([0-9]+) (.*)$/i, (res) ->
    nwo  = process.env.HUBOT_GITHUB_REPO
    user = res.envelope.user.name
    id   = res.match[1]
    body = res.match[2] + "\r\n\r\n_submitted by #{user}_"
    url  = "/repos/#{nwo}/issues/#{id}/comments"

    postComment = (github) ->
      github.post url, {body: body}, (comment) ->
        res.reply "I've posted your comment for you at #{comment.html_url}"

    return postComment(githubot(robot)) unless useIdentity

    robot.identity.findToken user, (err, token) ->
      if err
        handleTokenError(res, err)
      else
        postComment(githubot(robot, token: token))
