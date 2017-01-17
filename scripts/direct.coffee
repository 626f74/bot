# Direct Commands

module.exports = (robot) ->
   
   robot.respond /open the (.*) doors/i, (res) ->
     doorType = res.match[1]
     if doorType is "pod bay"
       res.reply "I'm afraid I can't let you do that."
     else
       res.reply "Opening #{doorType} doors"
  
   # laugh responses
   lulz = ['lol', 'rofl', 'lmao']
   robot.respond /lulz/i, (res) ->
     res.send res.random lulz
   
   # Shell commands 
   robot.respond /ls/i, (res) ->
     {spawn} = require 'child_process'
     ls = spawn 'ls', ['-l','-h']
     ls.stdout.on 'data', (data) -> res.send "```text\r\n" + data.toString().trim() + "\r\n```"
     ls.stderr.on 'data', (data) -> res.send data.toString().trim()

