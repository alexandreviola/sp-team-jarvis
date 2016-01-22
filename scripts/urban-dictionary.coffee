# Description:
#   Need to know a definition of a word from Urban Dictionary?
#   Use `ud-define` to get your answer from Urban Dictionary!
#
#   *** Created to be used with Slack ***
#   *** Use at your own risk! Most responses are NSFW ***
#
#   This script relies on the Mashape Urban Dictionary API.
#   You will need to set up an account and get an application
#   key before you can use the script.
#
#   https://www.mashape.com
#
# Dependencies:
#   "unirest": "0.4.2"
#
# Configuration:
#   HUBOT_MASHAPE_KEY
#
# Commands:
#   hubot ud-define <word> - Returns the definition of the word from Urban Dictionary
#
# Author:
#   BryanSaxon, cpradio

unirest = require('unirest')

module.exports = (robot) ->
  robot.respond /(ud-define) (.*)/i, (msg) ->
    user = msg.message.user.id
    term = msg.match[2]
    unirest.
    get("https://mashape-community-urban-dictionary.p.mashape.com/define?term=#{term}").
    header('X-Mashape-Key', process.env.HUBOT_MASHAPE_KEY).
    header('Accept', 'text/plain').
    end (result) ->
      answer = result.body.list[0]
      if typeof answer == 'undefined'
        response = "Could not find definition on Urban Dictionary."
      else
        response = "*Definition:*\n#{answer.definition}\n*Example:*\n#{answer.example}"
      msg.send user, response
      return
