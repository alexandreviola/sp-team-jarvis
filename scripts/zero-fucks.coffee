# Description:
#   zero fucks were given that day
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands
#   :fu: - response with "zero ***** were given that day"
#   hubot whatever
#   hubot how many fucks were given that day?
#
# Author:
#   cpradio

module.exports = (robot) ->
  robot.hear /\:fu\:/i, (msg) ->
    msg.send "zero ***** were given that day"

  robot.respond /(whatever|how many fucks were given that day\??)/i, (msg) ->
    msg.send "zero ***** were given that day"
