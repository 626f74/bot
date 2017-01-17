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
   #robot.respond /ls/i, (res) ->
   #  {spawn} = require 'child_process'
   #  ls = spawn 'ls', ['-l','-h']
   #  ls.stdout.on 'data', (data) -> res.send "```text\r\n" + data.toString().trim() + "\r\n```"
   #  ls.stderr.on 'data', (data) -> res.send data.toString().trim()


   # mongodump
   #robot.respond /mongodump/i, (res) ->
   #  {spawn} = require 'child_process'
   #  automongodump = spawn '/bin/bash', ['src/automongodump.sh']
   #  automongodump.stdout.on 'data', (data) -> res.send data.toString().trim()
   #  automongodump.stderr.on 'data', (data) -> res.send data.toString().trim()

   # v2
   robot.respond /do (.*)/i, (msg) ->
     @exec = require('child_process').exec
     command = "#{msg.match[1]}"
     @exec command, (error, stdout, stderr) ->
       msg.send error
       msg.send stdout
       msg.send stderr


   #script 1
   #robot.respond /script (.*)/i, (res) ->
   #  {spawn} = require 'child_process'
   #  script = res.match[1]
   #  automongodump = spawn '/bin/bash', ["src/ssh.sh", "#{script}"]
   #  automongodump.stdout.on 'data', (data) -> res.send data.toString().trim()
   #  automongodump.stderr.on 'data', (data) -> res.send data.toString().trim()

 
   #script 2
   robot.respond /\:(.*)/i, (msg) ->
     @spawn = require('child_process').exec
     msg.send "Executing #{msg.match[1]}..."
     @spawn "/bin/bash src/ssh.sh #{msg.match[1]}", (error, stdout, stderr) ->
       msg.send error
       msg.send stdout
       msg.send stderr

