# Description:
#   Temperature Calculations
#
# Dependencies:
#   None
#
# Configuration:
#   None
# 
# Commands:
#   hubot what does the fox say?
#
# Author:
#   cpradio

responses = [
  "www.youtube.com/watch?v=jofNR_WkoCE",
  "Ring-ding-ding-ding-dingeringeding!",
  "Wa-pa-pa-pa-pa-pa-pow!",
  "Joff-tchoff-tchoff-tchoffo-tchoffo-tchoff!",
  "Jacha-chacha-chacha-chow!",
  "Fraka-kaka-kaka-kaka-kow!",
  "A-hee-ahee ha-hee!",
  "A-oo-oo-oo-ooo!",
  "www.youtube.com/watch?v=foMQX9ZExsE"
]

module.exports = (robot) ->
  robot.respond /what does the fox say\??$/i, (msg) ->
    return msg.send msg.random responses