#!/usr/bin/env ruby

require "redlock"

$step = -1

$steps = [
  "Welcome to interactive RedLock testing!

  We will cover critical scenarios to make sure migration can be done without downtime.

  Call 'go' to start the interactive test...",

  "Okay, first step. Lets connect Redlock to 3 redis instances.

  Run:

  redlock = Redlock::Client.new(['redis://first:6379','redis://second:6379','redis://third:6379'], :retry_count => 1)

  Enter go once you're done.",

  "Lets make sure Redis instances are empty.

  Run:

  Redis.new(url: 'redis://first:6379').keys + Redis.new(url: 'redis://second:6379').keys + Redis.new(url: 'redis://third:6379').keys",

  "Finally some fine stuff. Lets use Redlock to create lock:

  Run:

  redlock.lock('lock', 1000000)",

  "Lets see whats in there.

  Run:

  Redis.new(url: 'redis://first:6379').keys

  then

  Redis.new(url: 'redis://second:6379').keys

  and

  Redis.new(url: 'redis://third:6379').keys",

]

def go
  puts $steps[$step += 1]
end

go
