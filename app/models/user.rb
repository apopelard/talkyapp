class User < ActiveRecord::Base

has_many :stories

has_many :user_as_followed, :class_name => "Follower", :foreign_key => "following_id"
has_many :followers, :through => :user_as_followed, :source => "following"

has_many :user_as_following, :class_name => "Follower", :foreign_key => "user_id"
has_many :followings, :through => :user_as_following, :source => "followed"

def full_name
  return "#{first_name} #{last_name}"
end

end
