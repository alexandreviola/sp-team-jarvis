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

CURSING_PATTERN = /\b([f]+[u]+[c]+[k]+|[s]+[h]+[i]+[t]+|[b]+[i]+[t}+[c]+[h]+|[a]+[s]{2,}|[b]+[u]+[l]+[l]+[s]+[h]+[i]+[t]+|[d]+[a]+[m]+[n]+|[s]+[c]+[r}+[e]+[w]+)\b/ig

patronizing_tone = [
  "Do you kiss your mother with that mouth?",
  "JUVENILES PRESENT! Keep it family friendly, after all, I'm not even BETA YET and @ryanreese09 just started Junior High!"
]

module.exports = (robot) ->
  robot.hear CURSING_PATTERN, (msg) ->
    msg.send msg.random patronizing_tone
