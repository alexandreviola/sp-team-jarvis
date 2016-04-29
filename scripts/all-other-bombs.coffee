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
#   hubot <text> bomb me <number> - Many many <text>s!
#
# Author:
#   cpradio

module.exports = (robot) ->
  robot.hear /^jarvis (?!(bear|cat|kitten|sloth|sheen|corgi|pug))(.*) bomb(?: me)?( \d+)?$/i, (msg) ->
    texts = parseInt(msg.match[3]) || 5
    bombMe(msg, msg.match[2], texts)

bombMe = (msg, text, number)->
  msg.http('http://api.pixplorer.co.uk/image?amount=' + number + '&word=' + encodeURIComponent(text))
    .get() (err, res, body) ->
      msg.send image.imageurl for image in JSON.parse(body).images
