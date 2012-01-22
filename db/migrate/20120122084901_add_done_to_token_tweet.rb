class AddDoneToTokenTweet < ActiveRecord::Migration
  def change
    add_column :token_tweets, :done, :boolean , :default=>0
  end
end
