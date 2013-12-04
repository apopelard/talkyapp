module ApplicationHelper
  def rating
    result = ""
    user_rating = 0.0
    unless @user.stories.empty?
      @user.stories.each do |story|
        user_rating = user_rating + story.rating.to_f
      end
      user_rating = user_rating / @user.stories.count
    end
    if user_rating!=0
      (1..user_rating).each do |i|
        result << "<span class=\"glyphicon glyphicon-star\"></span> "
      end
      empty_stars = 5 - user_rating.to_i
      (1..empty_stars).each do |i|
        result << "<span class=\"glyphicon glyphicon-star-empty\"></span> "
      end
    end
    return result.html_safe
  end
end
