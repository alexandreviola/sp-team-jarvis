# Description:
#   Show a "No Cigar" image when someone says "close"
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   soon - Display a no cigar image (allows for many Os)
#
# Author:
#   keithamus

images = [
  "http://i.imgur.com/W8skjnc.jpg"
]

module.exports = (robot) ->
  robot.hear /\bclose\b/i, (msg) ->
    msg.send msg.random images
