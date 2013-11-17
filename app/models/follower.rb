class Follower < ActiveRecord::Base
  belongs_to :following, :class_name => "User", :foreign_key => "user_id"
  belongs_to :followed, :class_name => "User", :foreign_key => "following_id"
end
