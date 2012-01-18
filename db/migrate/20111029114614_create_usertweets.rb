class CreateUsertweets < ActiveRecord::Migration
  def change
    create_table :usertweets do |t|
      t.string :uid
      t.string :tweetid

      t.timestamps
    end
  end
end
