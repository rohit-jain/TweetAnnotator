#!/usr/bin/env ruby
require 'rubygems'

require 'mysql'

db = Mysql.new('localhost', 'root', 'jain', 'hack_development')

begin
  insert_new_tweet = db.prepare "INSERT INTO TWEET(text) VALUES (?)"
  insert_new_tweet.execute 'test'

  insert_new_tweet.close

ensure
  db.close
end
