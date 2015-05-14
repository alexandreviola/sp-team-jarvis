# Description:
#   All Other Bombs!
#
# Dependencies:
#   None
#
# Configuration:
#   None
# 
# Commands:
#   hubot <text> me - A randomly selected <text>
#   hubot <text> bomb me <number> - Many many <text>s!
#
# Author:
#   cpradio

module.exports = (robot) ->
  robot.hear /^jarvis (?!(bear|cat|kitten|sloth|sheen|corgi|pug))(.*) bomb(?: me)?( \d+)?$/i, (msg) ->
    texts = msg.match[3] || 5
    bombMe(msg, msg.match[2]) for i in [1..texts]

bombMe = (msg, text)->
  msg.http('http://www.pixplorer.co.uk/getimage/' + encodeURIComponent(text))
    .get() (err, res, body) ->
      msg.send JSON.parse(body).imglink