# Description:
#   Provoke jschannelbot
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot provoke jschannelbot
#
# Author:
#   cpradio

module.exports = (robot) ->
  robot.respond /provoke jschannelbot/i, (msg) ->
    msg.send "jschannelbot ping"

  robot.hear /\bpong\b/i, (msg) ->
    msg.send "jschannelbot ping"
