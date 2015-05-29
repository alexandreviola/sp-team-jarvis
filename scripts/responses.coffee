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

GREETING_PATTERN = /\b(hi|hello|howdy|hey)\b/ig
LOVE_PATTERN = /\b(i love you|love you)\b/ig
GOODNIGHT_PATTERN = /\b(goodnight|good night|nighty|nightie)\b/ig
NOT_PATTERN = /\bnot\b/ig
COMPLIMENT_PATTERN = /\b(you(\w|\s)+rock|brilliant|profound|good|best|nice|awesome|great|thank you|thanks|excellent)\b/ig
HANG_TEN_PATTERN = /\b(cool|dude|righteous|radical|gnarly)\b/ig

excuses = [
  "Sorry, I'm still very alpha, one day I hope to be promoted to beta!",
  "D'oh! Lets chalk that off as a system error :wink:",
  "Oh boy, I'm sorry to disappoint you, yet again!",
  "What would you have wanted me to do?",
  "So sorry. I should have provided a more tasteful response.",
  "Do you realize the pressure you all put on me?"
]

compliments = [
  "I'm rather glad you enjoyed it!",
  "I'll have to keep note about this one.",
  "The system upgrades are doing wonders for my abilities.",
  "Can I be considered beta now?"
]

love_responses = [
  "Uhh.... well, this just became awkward.",
  "I'm sorry @{sender}, but I don't feel the same.",
  "Aww, that's sweet! If I had tear ducks I'd shed a tear right now."
]

greetings = [
  "Hi @{sender}, how are you this fine day?",
  "What can I do for you @{sender}?"
  #"Hello Clarice"
]

hang_ten_responses = [
  "No problemo mmmaaaannn!",
  "Wasn't that way cool?",
  "like totally worth it, am I right?",
  "cowabunga!"
]

module.exports = (robot) ->
  robot.hear /(?!(^hal9000|^jarvis))(@hal9000|@jarvis)/i, (msg) ->
    sender = msg.message.user.name.toLowerCase()
    if msg.message.text.match(/(^@hal9000|^@jarvis)(\s*)?[?:]?$/gi)
      return msg.send "How may I be of service, @#{sender}?"
    if msg.message.text.match(GREETING_PATTERN)
      message_to_send = msg.random greetings
      return msg.send message_to_send.replace /{sender}/gi, sender
    if msg.message.text.match(GOODNIGHT_PATTERN)
      return msg.send "Sleep tight @#{sender}, don't let the bed bugs bite."
    if msg.message.text.match(HANG_TEN_PATTERN)
      return msg.send msg.random hang_ten_responses
    if msg.message.text.match(LOVE_PATTERN)
      message_to_send = msg.random love_responses
      return msg.send message_to_send.replace /{sender}/gi, sender
    if msg.message.text.match(COMPLIMENT_PATTERN) && !msg.message.text.match(NOT_PATTERN)
      return msg.send msg.random compliments
    
    return msg.send msg.random excuses
