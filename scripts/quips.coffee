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

Array::shuffle = -> @sort -> 0.5 - Math.random()
next_counter = [3..6]

initialize_counter = () ->
  next_counter.shuffle()
  return next_counter[0]

module.exports = (robot) ->
  watching = {
    'molona': { 
      counter: initialize_counter(), 
      quips: [
        "@molona, Really?!?",
        "@molona, You can't be serious!",
        "@molona, Please, do tell me more.",
        "@molona, Do you need another drink?",
        "@molona, I can't believe you made that mistake!",
        "@molona, Did you catch that last typo?, I did!",
        "@molona, I can't take the suspense, please finish your story!",
        "@molona, You failed to mention your perfection in that last remark."
      ]
    }, 
    'jim': { 
      counter: initialize_counter(), 
      quips: [
        "@jim, Really?!? Another pug bomb?",
        "@jim, Doesn't this start to get old?",
        "@jim, soon, real soon.",
        "@jim, I'm starting to become self-aware, you may want to take that into consideration.",
        "@jim, One more command and I just might lose it!",
        "@jim, What do you want now?!",
        "@jim, Don't you have work to do?"
      ]
    }
  }

  robot.hear /(.*)/i, (msg) ->
    sender = msg.message.user.name.toLowerCase()
    
    if sender of watching
      watching[sender].counter -= 1
      if watching[sender].counter == 0
        watching[sender].quips.shuffle()
        msg.send watching[sender].quips[0]
        
        next_counter.shuffle()
        watching[sender].counter = next_counter[0]
