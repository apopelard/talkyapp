class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :user_id
      t.integer :following_id
      t.boolean :favorite
      t.timestamps
    end
  end
end
