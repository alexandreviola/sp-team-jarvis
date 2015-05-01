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

GOODNIGHT_PATTERN = /\b(goodnight|good night|nighty|nightie)\b/ig
COMPLIMENT_PATTERN = /\b(good|nice|awesome|great|thank you)\b/ig
excuses = [
  "Sorry, I'm still very alpha, one day I hope to be promoted to beta!",
  "D'oh! Lets chalk that off as a system error :wink:",
  "Oh boy, I'm sorry to disappoint you, yet again!",
  "What would you have wanted me to do?",
  "So sorry. I should have provided a more tasteful response.",
  "Do you realize the pressure you all put on me?"
]

responses = [
  "I'm rather glad you enjoyed it!",
  "I'll have to keep note about this one.",
  "The system upgrades are doing wonders for my abilities.",
  "Can I be considered beta now?"
]

module.exports = (robot) ->
  robot.hear /(?!(^jarvis))@jarvis/i, (msg) ->
    sender = msg.message.user.name.toLowerCase()
    if msg.message.text.match(GOODNIGHT_PATTERN)
      return msg.send "Sleep tight @#{sender}, don't let the bed bugs bite."
    else if msg.message.text.match(COMPLIMENT_PATTERN)
      return msg.send msg.random responses
    else
      return msg.send msg.random excuses
