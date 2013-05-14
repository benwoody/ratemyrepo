class AddCurrentFieldToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :current, :boolean, default: true
  end
end
