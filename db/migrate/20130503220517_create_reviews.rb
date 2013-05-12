class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :repo_id
      t.integer :rating
      t.text    :comment

      t.timestamps
    end

    add_index :reviews, :user_id
    add_index :reviews, :repo_id
  end
end
