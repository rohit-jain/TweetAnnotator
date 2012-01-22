class AddVotesToTweeples < ActiveRecord::Migration
  def change
    add_column :tweeples, :vote, :integer
  end
end
