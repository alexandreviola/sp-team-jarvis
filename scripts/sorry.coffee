# Description:
#   Sorry
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands
#   sorry - response with "Sorry <user>, but I can't do that"
#
# Author:
#   cpradio

module.exports = (robot) ->
  robot.hear /\bs[o]+rry\b/i, (msg) ->
    msg.send "Sorry " +  msg.message.user.name + ", but I can't do that"
