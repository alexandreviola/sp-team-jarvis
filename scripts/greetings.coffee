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

entering_messages = [
  "Hi! Are you here to keep me company?",
  "Hi! Will you be my friend?",
  "Hi! What tricks can you do to entertain me?"
]

module.exports = (robot) ->
  robot.enter (msg) ->
    msg.send msg.random entering_messages

  robot.leave (msg) ->
    msg.send "dun dun dun, another one bites the dust!"
