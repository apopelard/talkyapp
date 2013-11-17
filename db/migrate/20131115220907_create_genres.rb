class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.integer :story_id
      t.integer :category_id
      t.timestamps
    end
  end
end
