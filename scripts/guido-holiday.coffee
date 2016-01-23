# Description:
#   Guido Holiday Responses
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot is guido on holiday?
#   hubot is guido always on holiday?
#   hubot where is guido?
#   hubot what is guido doing?
#
# Author:
#   cpradio

holiday_responses = [
  "Yes, definitely on holiday",
  "There is a good chance he is on holiday right now.",
  "Of course he is!"
]

activity_responses = [
  "He is probably \"working from home\", or as the rest of us see it, not doing anything.",
  "He probably went out for ice cream.",
  "He is relaxing at the beach.",
  "He might be taking a bike ride."
]

module.exports = (robot) ->
  robot.respond /is @?guido(2004)?( always)? on holiday\??/i, (msg) ->
    return msg.send msg.random holiday_responses

  robot.respond /(what|where) is @?guido(2004)?( doing)?\??/i, (msg) ->
    return msg.send msg.random activity_responses
