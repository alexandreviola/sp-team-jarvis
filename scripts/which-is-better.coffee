# Description:
#   Which is Better?
#
# Dependencies:
#   None
#
# Configuration:
#   None
# 
# Commands:
#   hubot which is better[?] <text> or <text>?
#   hubot which is worse[?] <text> or <text>?
#
# Author:
#   cpradio

module.exports = (robot) ->
  robot.respond /which is (better|worse)\?* (.*) or (.*?)\??$/i, (msg) ->
    option_choosen = msg.random [2,3]
    msg.send "Clearly #{msg.match[option_choosen]} is #{msg.match[1]}"