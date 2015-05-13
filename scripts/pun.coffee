# Description:
#   Random Puns
#
# Dependencies:
#   None
#
# Configuration:
#   None
# 
# Commands:
#   hubot pun me - get a random pun
#
# Author:
#   cpradio

module.exports = (robot) ->
  robot.respond /pun(?: me)?$/i, (msg) ->
      msg.http("http://www.punoftheday.com/cgi-bin/arandompun.pl")
        .get() (err, res, body) ->
            pun = body.replace(/(<([^>]+)>)/ig, "").replace(/&[a-z]+;/gi, "").replace(/(document\.write\(')|('\))/g, "").split(/(\r\n|\r|\n)/)[0];
            msg.send pun