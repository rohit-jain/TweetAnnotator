class CreateTokenTweets < ActiveRecord::Migration
  def change
    create_table :token_tweets do |t|
      t.string :tweetId
      t.integer :token1Id
      t.integer :token2Id
      t.integer :category
      t.string :tweetText
      t.string :tweetToken1
      t.string :tweetToken2

      t.timestamps
    end
  end
end
