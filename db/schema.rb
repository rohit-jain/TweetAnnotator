# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120122084901) do

  create_table "feedbacks", :force => true do |t|
    t.integer  "tweeple_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feedbacks", ["tweeple_id"], :name => "index_feedbacks_on_tweeple_id"

  create_table "saved_tweets", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seed_tweets", :force => true do |t|
    t.string   "tweetId"
    t.integer  "token1Id"
    t.integer  "token2Id"
    t.integer  "category"
    t.string   "tweetText"
    t.string   "tweetToken1"
    t.string   "tweetToken2"
    t.integer  "voteCat1"
    t.integer  "voteCat2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "token_tweets", :force => true do |t|
    t.string   "tweetId"
    t.integer  "token1Id"
    t.integer  "token2Id"
    t.integer  "category"
    t.string   "tweetText"
    t.string   "tweetToken1"
    t.string   "tweetToken2"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "voteCat1",    :default => 0
    t.integer  "voteCat2",    :default => 0
    t.boolean  "done",        :default => false
  end

  create_table "tweeples", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vote"
  end

  create_table "tweet_saveds", :force => true do |t|
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usertweets", :force => true do |t|
    t.string   "uid"
    t.string   "tweetid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vocabs", :force => true do |t|
    t.string   "word"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vote_records", :force => true do |t|
    t.integer  "vote"
    t.integer  "tweeple_id"
    t.integer  "token_tweet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vote_records", ["token_tweet_id"], :name => "index_vote_records_on_token_tweet_id"
  add_index "vote_records", ["tweeple_id"], :name => "index_vote_records_on_tweeple_id"

end
