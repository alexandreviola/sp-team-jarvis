# Description:
#   miles/kilometers Calculations
#
# Dependencies:
#   None
#
# Configuration:
#   None
# 
# Commands:
#   hubot convert <length> to mi - convert <length> to miles
#   hubot convert <length>km - convert <length> to miles
#   hubot convert <length> to km - convert <length> to kilometers
#   hubot convert <length>mi - convert <length> to kilmeters
#
# Author:
#   cpradio

module.exports = (robot) ->
  robot.respond /convert ([\d\.]+) to mi$/i, (msg) ->
    length = msg.match[1]
    convertToMiles(msg, length)
    
  robot.respond /convert ([\d\.]+)km$/i, (msg) ->
    length = msg.match[1]
    convertToMiles(msg, length)

  robot.respond /convert ([\d\.]+) to km$/i, (msg) ->
    length = msg.match[1]
    convertToKilometers(msg, length)

  robot.respond /convert ([\d\.]+)mi$/i, (msg) ->
    length = msg.match[1]
    convertToKilometers(msg, length)

convertToMiles = (msg, length) ->
    converted = parseFloat(length) * 0.62137
    msg.send "#{length} km is #{converted} mi"
    
convertToKilometers = (msg, length) ->
    converted = parseFloat(length) / 0.62137
    msg.send "#{length} mi is #{converted} km"