#!/usr/bin/env ruby
require "rubygems"
require "twitter"
require 'mysql'
begin
db = Mysql.new('localhost', 'root', 'jain', 'hack_development')



search_query = String.new ARGV[0]

Twitter.search( search_query, :rpp =>1, :result_type => "recent").each do |status_t|

  begin
  insert_new_tweet = db.prepare "INSERT INTO TWEET(text) VALUES (?)"
  insert_new_tweet.execute status_t.text

  insert_new_tweet.close
  ensure
  end

	puts status_t
	puts "\n"
end

  db.close
end

