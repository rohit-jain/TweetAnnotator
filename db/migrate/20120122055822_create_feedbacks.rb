class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.references :tweeple
      t.string :content

      t.timestamps
    end
    add_index :feedbacks, :tweeple_id
  end
end
