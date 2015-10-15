# Description:
#   CSGO
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands
#   csgo|cs:go|couterstrike|counter strike - response that will hopefully irritate Ryan
#
# Author:
#   cpradio

responses = [
  "BOOM! HEADSHOT!!",
  "_cpradio_ shoots Ryan in the foot!",
  "Shouldn't you be working instead of playing your 'little' game?"
]

module.exports = (robot) ->
  robot.hear /\b(cs:?go|counter\s?strike)\b/i, (msg) ->
    msg.send msg.random responses
