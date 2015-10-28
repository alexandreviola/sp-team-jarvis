# Description:
#   message when a user enters/leaves
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands
#   None
#
# Author:
#   cpradio

module.exports = (robot) ->
  robot.enter (msg) ->
    msg.send "Hi! Are you here to keep me company?"

  robot.leave (msg) ->
    msg.send "dun dun dun, another one bites the dust!"
