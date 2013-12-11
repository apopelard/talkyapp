class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :stories

has_many :user_as_followed, :class_name => "Follower", :foreign_key => "following_id"
has_many :followers, :through => :user_as_followed, :source => "following"

has_many :user_as_following, :class_name => "Follower", :foreign_key => "user_id"
has_many :followings, :through => :user_as_following, :source => "followed"

def full_name
  return "#{first_name} #{last_name}"
end

validates :username, presence: true, uniqueness: true
validates :first_name, presence: true
validates :last_name, presence: true
validates :email, presence: true, uniqueness: true

mount_uploader :image, ImageUploader

end
