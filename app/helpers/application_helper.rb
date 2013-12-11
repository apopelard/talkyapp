module ApplicationHelper
  def rating(user)
    user_rating = 0.0
    unless user.stories.empty?
      user.stories.each do |story|
        user_rating = user_rating + story.rating.to_f
      end
      user_rating = user_rating / user.stories.count
    end
    return user_rating
  end

  def rating_stars(rating)
    result = ""
    if rating!=0
      (1..rating).each do |i|
        result << "<span class=\"glyphicon glyphicon-star\"></span> "
      end
      empty_stars = 5 - rating.to_i
      (1..empty_stars).each do |i|
        result << "<span class=\"glyphicon glyphicon-star-empty\"></span> "
      end
    else
      (1..5).each do |i|
        result << "<span class=\"glyphicon glyphicon-star-empty\"></span> "
      end
      #result << " <small>(no rating)</small>"
    end
    return result.html_safe
  end

  def follow_button(user, base_user)
    if base_user.followings.include? user
      link_to "Unfollow", follower_url(user.id), method: :delete, type: "button", class: "btn btn-xs btn-primary round"
    else
      link_to "Follow", followers_url(fid: user.id), method: :post, type: "button", class: "btn btn-xs btn-primary round"
    end
  end

  def story_tile(story, user)
    star_rating = ""
    story_categories = ""
    if user != story.user
      story_user = "@#{story.user.username} #{follow_button(story.user, user)}"
    else
      story_user = "<a type='button' class='btn btn-xs btn-primary round' href='#{edit_story_url(story.id)}'>edit story</a> "
    end
    story.categories.each do |category|
      story_categories << "<a type='button' class='btn btn-xs btn-primary round' href='#{stories_url(cat: category.name.downcase)}'>#{category.name}</a> "
    end
    result = "<div class='story_box'><a href='#{story_url(story.id)}'>
              <div class='story_title'>
                <div class='row'>
                  <div class='col-md-8'>
                    <b>#{story.name}</b>
                  </div>
                  <div class='col-md-4'>
                    #{rating_stars(story.rating)} <span class='badge'><small>#{story.votes}</small></span>
                  </div>
                </div>
              </div>
              <div class='row'>
              <div class='story_content'>
                <div class='col-md-8'>
                  <p>#{story.description}</p>
                  <p>#{image_tag story.image, size: '100', class: 'img-rounded'}</p>
                </div>
                <div class='col-md-4'>
                  <p>#{story_user}</p>
                </div>
              </div>
            </div>
              <div class='story_bottom bottom_round'>
                #{story_categories}
              </div></a>
            </div>"
    return result.html_safe
  end

  def user_profile(user, base_user)
    return "<div class='row follow-box profile-link'><a href='#{user_url(user)}'>
              <div class='col-md-2'>
                #{image_tag user.image, class: 'img-circle', width: '40', alt: user.full_name}
              </div>
              <div class='col-md-8'>
                <p class='p-zero'><strong>#{user.full_name}</strong> | @#{user.username}</p>
                <p class='p-zero'>#{user.location}</p>
                <p class='p-zero'>#{rating_stars(rating(user))}</p>
              </div>
              <div class='col-md-2'>
                #{follow_button(user,base_user)}
              </div></a>
            </div>".html_safe
  end
end
