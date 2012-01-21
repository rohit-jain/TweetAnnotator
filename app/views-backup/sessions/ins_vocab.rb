#!/usr/bin/env ruby
require 'mysql'
begin
db = Mysql.new('localhost', 'root', 'jain', 'hack_development')


words = File.open('vocab.txt') do |f|; f.each_line.map{ |l| l.split[1] }; end

words.each do |a|
begin
  insert_new_tweet = db.prepare "INSERT INTO vocabs(word) VALUES (?)"
  insert_new_tweet.execute a
  insert_new_tweet.close
  ensure
end
end

  db.close
end

