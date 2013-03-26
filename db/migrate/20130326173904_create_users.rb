class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :limit => 16
      t.string :email,    :limit => 64
      t.string :bio
      t.string :uid
      t.string :fullname

      t.timestamps
    end
  end
end
