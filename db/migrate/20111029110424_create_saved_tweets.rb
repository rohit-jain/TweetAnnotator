class CreateSavedTweets < ActiveRecord::Migration
  def change
    create_table :saved_tweets do |t|

      t.timestamps
    end
  end
end
