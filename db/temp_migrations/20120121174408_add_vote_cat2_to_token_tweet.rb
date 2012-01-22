class AddVoteCat2ToTokenTweet < ActiveRecord::Migration
  def change
    add_column :token_tweets, :voteCat2, :integer
  end
end
