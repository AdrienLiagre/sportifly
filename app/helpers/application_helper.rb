module ApplicationHelper
  def user_picture(user)
    @user = user
     if @user.picture.exists?
       image_tag @user.picture(:medium), class: "dashboard-avatar img-responsive"
     else
       image_tag 'default_profile_300.png', class: "dashboard-avatar img-responsive"
     end
  end

  def captain_picture(user)
    @user = user
     if @user.picture.exists?
       image_tag @user.picture(:thumb), class: "dashboard-avatar img-responsive activity-page--participants-avatar "
     else
       image_tag 'default_profile_100.png', class: "dashboard-avatar img-responsive"
     end
  end

  def sport_picture(sport)
    if @activity.sport.picture.exists?
       image_tag @activity.sport.picture, class: "main-banner-sport"
     else
       # image_tag 'avatar.png', class: "dashboard-sport-picture img-responsive"
     end
  end

  def stats_per_user(user)
    stats = {}

    user.bookings.each do |booking|
      if stats[booking.activity.sport.name]
        stats[booking.activity.sport.name] += 1
      else
        stats[booking.activity.sport.name] = 1
      end
    end

    return stats
  end

  def title
    content_for?(:title) ? content_for(:title) : DEFAULT_META['default_title']
  end

  def meta_description
    content_for?(:meta_description) ? content_for(:meta_description) : DEFAULT_META['meta_description']
  end

  def meta_image
    content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META['meta_image']
  end
end

