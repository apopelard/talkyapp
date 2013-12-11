class RenameImageUrlToImage < ActiveRecord::Migration
  def change
    rename_column :stories, :picture_url, :image
    rename_column :users, :picture_url, :image
  end
end
