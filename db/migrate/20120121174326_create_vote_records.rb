class CreateVoteRecords < ActiveRecord::Migration
  def change
    create_table :vote_records do |t|
      t.integer :vote
      t.references :tweeple
      t.references :token_tweet

      t.timestamps
    end
    add_index :vote_records, :tweeple_id
    add_index :vote_records, :token_tweet_id
  end
end
