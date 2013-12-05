class AddVoteToStory < ActiveRecord::Migration
  def change
    change_table :stories do |t|
      t.integer :votes
    end
  end
end
