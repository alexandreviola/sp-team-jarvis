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
#   hubot, (push|kick|punch|shove|hit|throw|teach) <text> - response with "Sorry <user>, but I can't do that"
#   (push|kick|punch|shove|hit|throw|teach) <text> hubot - response with "Sorry <user>, but I can't do that"
# Author:
#   cpradio

module.exports = (robot) ->
  robot.hear /\bjarvis,? (push|kick|punch|shove|hit|throw|teach) (.*)\b/i, (msg) ->
    msg.send "Sorry " +  msg.message.user.name + ", but I can't do that"
  robot.hear /\b(push|kick|punch|shove|hit|throw|teach) (.*) jarvis!?$/i, (msg) ->
    msg.send "Sorry " +  msg.message.user.name + ", but I can't do that"
