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

molona_quips = [
  "@molona, Really?!?",
  "@molona, You can't be serious!",
  "@molona, Please, do tell me more.",
  "@molona, Do you need another drink?",
  "@molona, I can't believe you made that mistake!",
  "@molona, Did you catch that last typo?, I did!",
  "@molona, I can't take the suspense, please finish your story!",
  "@molona, You failed to mention your perfection in that last remark."
]

module.exports = (robot) ->
  counter = 0
  cap = 8

  robot.hear /(.*)/i, (msg) ->
    sender = msg.message.user.name.toLowerCase()
    if sender == "molona"
      counter += 1
      if counter != 0 && counter % cap == 0
        msg.send msg.random molona_quips
        cap = msg.random [3..8]
        counter = 0
