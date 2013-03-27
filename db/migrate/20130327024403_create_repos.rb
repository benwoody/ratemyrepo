class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.string :name
      t.string :description
      t.boolean :fork
      t.string :url
      t.integer :user_id

      t.timestamps
    end
  end
end
