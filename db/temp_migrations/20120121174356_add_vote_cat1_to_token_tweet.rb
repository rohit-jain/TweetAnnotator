class AddVoteCat1ToTokenTweet < ActiveRecord::Migration
  def change
    add_column :token_tweets, :voteCat1, :integer
  end
end
