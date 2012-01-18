class CreateTweetSaveds < ActiveRecord::Migration
  def change
    create_table :tweet_saveds do |t|
      t.string :uid

      t.timestamps
    end
  end
end
