class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :picture_url
      t.string :email
      t.datetime :last_visit
      t.timestamps
    end
  end
end
