# Description:
#   Show combo breaker images
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   combo breaker - displays a related image
#
# Author:
#   cpradio

images = [
  "http://i.imgur.com/qwkbzf5.png",
  "https://c1.staticflickr.com/3/2533/3967014086_ddc4536b4a.jpg",
  "http://pinkie.mylittlefacewhen.com/media/f/rsz/mlfw4912_medium.jpg"
]

module.exports = (robot) ->
  robot.hear /\b[c-]+ombo breaker\b/i, (msg) ->
    msg.send msg.random images

