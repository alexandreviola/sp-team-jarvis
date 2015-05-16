# Description:
#   Who's your master?
#
# Dependencies:
#   None
#
# Configuration:
#   None
# 
# Commands:
#   hubot who's your master?
#   hubot who is your master?
#
# Author:
#   cpradio

responses = {
  'cpradio': "You are, O Great One!",
  'molona': "Although your perfection astounds me, you are not my master.",
  'other': "My master is the all powerful, all wonderful, cpradio (and the other creators whose scripts I possess)!"
}

module.exports = (robot) ->
  robot.respond /who's (the master|your master|the boss|your boss)\?$/i, (msg) ->
    masterMe msg
    
  robot.respond /who is (the master|your master|the boss|your boss)\?$/i, (msg) ->
    masterMe msg

masterMe = (msg) ->
    sender = msg.message.user.name.toLowerCase()
    if sender of responses
      msg.send responses[sender]
    else
      msg.send responses['other']