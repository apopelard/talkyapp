# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# adding 29 users
=begin
User.destroy_all

require 'open-uri'
require 'json'

url = 'http://kiei925.herokuapp.com/students.json?access_token=broncos'
raw_data = open(url).read
users = JSON.parse(raw_data)
users.each do |user|
  u = User.new
  u.username = user["first_name"][0].downcase+user["last_name"].downcase
  u.first_name = user["first_name"]
  u.last_name = user["last_name"]
  u.location = "USA"
  u.picture_url = user["image_url"]
  u.email = u.username+"2014@kellogg.northwestern.edu"
  u.save
end

puts "There are now #{User.count} students in the database."
=end
# adding followers
Follower.destroy_all

users = User.all
users.each do |user|
  i = 0
  while i<3 do
    f = Follower.new
    f.user_id = user.id
    uid = 0
    while (uid == 0) do
      if (f.following_id != user.id)
        f.following_id = users.sample.id
        uid = 1
        Follower.where(:id => user.id).each do |follow|
          if follow.following_id == f.following_id
            uid = 0
          end
        end
      end
    end
    f.save
    i = i+1
  end
end

puts "There are now #{Follower.count} students in the database."
