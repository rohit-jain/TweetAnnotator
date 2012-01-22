class CreateSeedTweets < ActiveRecord::Migration
  def change
    create_table :seed_tweets do |t|
      t.string :tweetId
      t.integer :token1Id
      t.integer :token2Id
      t.integer :category
      t.string :tweetText
      t.string :tweetToken1
      t.string :tweetToken2
      t.integer :voteCat1
      t.integer :voteCat2

      t.timestamps
    end
  end
end

=begin
 rails generate model SeedTweet tweetId:string token1Id:integer 
 token2Id:integer category:integer tweetText:string tweetToken1:string 
 tweetToken2:string voteCat1:integer voteCat2:integer 
=end