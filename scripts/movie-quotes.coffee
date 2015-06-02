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
#   hubot Uh...say, Jarvis, is it that time?
#   hubot you know what to do
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
    
  robot.respond /uh...say, jarvis, is it that time\?/i, (msg) ->
    msg.send "The 'house party' protocol, sir?"
    
  robot.respond /you know what to do/i, (msg) ->
    msg.send "The 'clean slate' protocol, sir?"