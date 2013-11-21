class Story < ActiveRecord::Base

  belongs_to :user

  has_many :category_type, :class_name => "Genre", :foreign_key => "story_id"
  has_many :categories, :through => :category_type, :source => "category"
end
