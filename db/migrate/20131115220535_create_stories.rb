class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :name
      t.string :description
      t.string :address1
      t.string :address2
      t.string :postcode
      t.string :city
      t.string :state
      t.string :country
      t.float :latitude
      t.float :longitute
      t.string :picture_url
      t.string :audio_url
      t.float :rating
      t.integer :user_id
      t.timestamps
    end
  end
end
