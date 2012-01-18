#!/usr/bin/env ruby
require "rubygems"
require "twitter"

screen_name = String.new ARGV[0]

a_user = Twitter.user(screen_name)

if a_user.protected != true

  puts "Username   : " + a_user.screen_name.to_s
  puts "Name       : " + a_user.name
  puts "Id         : " + a_user.id_str
  puts "Location   : " + a_user.location
  puts "User since : " + a_user.created_at.to_s
  puts "Bio        : " + a_user.description.to_s
  puts "Followers  : " + a_user.followers_count.to_s
  puts "Friends    : " + a_user.friends_count.to_s
  puts "Listed Cnt : " + a_user.listed_count.to_s
  puts "Tweet Cnt  : " + a_user.statuses_count.to_s
  puts "Geocoded   : " + a_user.geo_enabled.to_s
  puts "Language   : " + a_user.lang
  if (a_user.url != nil)
    puts "URL        : " + a_user.url.to_s
  end
  if (a_user.time_zone != nil)
    puts "Time Zone  : " + a_user.time_zone
  end
  puts "Verified   : " + a_user.verified.to_s
  puts

  tweet = Twitter.user_timeline(screen_name).first

  puts "Tweet time : " + tweet.created_at
  puts "Tweet ID   : " + tweet.id.to_s
  puts "Tweet text : " + tweet.text

end
