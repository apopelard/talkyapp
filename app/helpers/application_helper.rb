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

  def follow_button(user)
    if current_user.followings.include? user
      link_to "Unfollow", follower_url(user.id), method: :delete, type: "button", class: "btn btn-xs btn-primary round"
    else
      link_to "Follow", followers_url(fid: user.id), method: :post, type: "button", class: "btn btn-xs btn-primary round"
    end
  end

  def story_tile(story, user)
    star_rating = ""
    story_categories = ""
    if user != story.user
      story_user = "@#{story.user.username} #{follow_button(story.user)}"
    else
      story_user = "<a type='button' class='btn btn-xs btn-primary round' href='#{edit_story_url(story.id)}'>edit story</a> "
    end
    (1..story.rating).each do |i|
      star_rating << "<span class='glyphicon glyphicon-star'></span>"
    end
      @empty_stars = 5 - story.rating.to_i
    (1..@empty_stars).each do |i|
      star_rating << "<span class='glyphicon glyphicon-star-empty'></span>"
    end
    story.categories.each do |category|
      story_categories << "<a type='button' class='btn btn-xs btn-primary round' href='#{stories_url(cat: category.name.downcase)}'>#{category.name}</a> "
    end
    result = "<div class='story_box'>
              <div class='story_title'>
                <div class='row'>
                  <div class='col-md-8'>
                    <b>#{story.name}</b>
                  </div>
                  <div class='col-md-4'>
                    #{star_rating} <span class='badge'><small>#{story.votes}</small></span>
                  </div>
                </div>
              </div>
              <div class='row'>
              <div class='story_content'>
                <div class='col-md-8'>
                  <p>#{story.description}</p>
                  <p>#{image_tag story.picture_url, size: '100', class: 'img-rounded'}</p>
                </div>
                <div class='col-md-4'>
                  <p>#{story_user}</p>
                  <p>#{link_to 'Story details', story_url(story.id)}</p>
                </div>
              </div>
            </div>
              <div class='story_bottom bottom_round'>
                #{story_categories}
              </div>
            </div>"
    return result.html_safe
  end
end
