# Description:
#   Sorry
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands
#   hubot, (push|kick|punch|shove|hit|throw) <text> - response with "Sorry <user>, but I can't do that"
#   (push|kick|punch|shove|hit|throw) <text> hubot - response with "Sorry <user>, but I can't do that"
# Author:
#   cpradio

module.exports = (robot) ->
  robot.hear /\bjarvis, (push|kick|punch|shove|hit|throw) (.*)\b/i, (msg) ->
    msg.send "Sorry " +  msg.message.user.name + ", but I can't do that"
  robot.hear /\b(push|kick|punch|shove|hit|throw) (.*) jarvis$/i, (msg) ->
    msg.send "Sorry " +  msg.message.user.name + ", but I can't do that"
