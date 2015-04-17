# Description:
#   None
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   cpradio

excuses = [
  "Sorry, I'm still very alpha, one day I hope to be promoted to beta!",
  "d'Oh, lets chalk that off as a system error :wink:",
  "Oh boy, I'm sorry to disappoint you, yet again!",
  "What would you have wanted me to do?",
  "So sorry. I should have provide a more tasteful response.",
  "Do you realize the pressure you all put on me?"
]

module.exports = (robot) ->
  robot.hear /\bjarvis\b(?<!^jarvis)/i, (msg) ->
    msg.send msg.random excuses
