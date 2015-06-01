# Description:
#   Returns a response if he is up
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot are you up?
#   hubot are you there?
#   hubot a little ostentation, don't you think?
#   hubot throw a little hit-rod red in there
#
# Author:
#   cpradio

module.exports = (robot) ->
  robot.respond /are you up\?/i, (msg) ->
    msg.send "For you sir, always."
    
  robot.respond /are you there\?/i, (msg) ->
    msg.send "At your service sir."
    
  robot.respond /a little ostentatious, don't you think\?/i, (msg) ->
    msg.send "_sarcasm_ What was I thinking? You're usually so discreet."
    
  robot.respond /throw a little hot-rod red in there/i, (msg) ->
    msg.send "Oh yes. That should help you keep a low profile."