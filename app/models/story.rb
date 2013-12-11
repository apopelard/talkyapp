class Story < ActiveRecord::Base

  belongs_to :user

  has_many :category_type, :class_name => "Genre", :foreign_key => "story_id"
  has_many :categories, :through => :category_type, :source => "category"

  validates :name, presence: true
  validates :address1, presence: true
  validates :city, presence: true
  validates :audio, presence: true
  validates :user_id, presence: true

  mount_uploader :image, ImageUploader
  mount_uploader :audio, AudioUploader

end
