# Description:
#   Temperature Calculations
#
# Dependencies:
#   None
#
# Configuration:
#   None
# 
# Commands:
#   hubot convert <degree> to C - convert <degree> to Celsius
#   hubot convert <degree> to F - convert <degree> to Fahrenheit
#
# Author:
#   cpradio

module.exports = (robot) ->
  robot.respond /convert ([\d]+) to C$/i, (msg) ->
    degree = msg.match[1]
    converted = (parseInt(degree, 10) - 32) * 5/9
    msg.send "#{degree}° Fahrenheit is #{converted}° Celsius"

  robot.respond /convert ([\d]+) to F$/i, (msg) ->
    degree = msg.match[1]
    converted = parseInt(degree, 10) * 9/5 + 32
    msg.send "#{degree}° Celsius is #{converted}° Fahrenheit"
