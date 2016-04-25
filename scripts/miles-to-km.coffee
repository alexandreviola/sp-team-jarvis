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
#   hubot convert <length>(km) to mi(les) - convert <length> kilometers to miles
#   hubot convert <length>km - convert <length> kilometers to miles
#   hubot convert <length>(mi|miles) to km - convert <length> miles to kilometers
#   hubot convert <length>mi(les) - convert <length> miles to kilmeters
#
# Author:
#   cpradio

module.exports = (robot) ->
  robot.respond /convert ([\d\.]+)\s?(km)? to mi(les)?$/i, (msg) ->
    length = msg.match[1]
    convertToMiles(msg, length)

  robot.respond /convert ([\d\.]+)\s?km$/i, (msg) ->
    length = msg.match[1]
    convertToMiles(msg, length)

  robot.respond /convert ([\d\.]+)\s?(mi(les)?)? to km$/i, (msg) ->
    length = msg.match[1]
    convertToKilometers(msg, length)

  robot.respond /convert ([\d\.]+)\s?mi(les)?$/i, (msg) ->
    length = msg.match[1]
    convertToKilometers(msg, length)

convertToMiles = (msg, length) ->
    converted = parseFloat(length) * 0.62137
    msg.send "#{length} km is #{converted} mi"

convertToKilometers = (msg, length) ->
    converted = parseFloat(length) / 0.62137
    msg.send "#{length} mi is #{converted} km"
