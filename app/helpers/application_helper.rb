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
       image_tag @user.picture(:thumb), class: "dashboard-avatar img-responsive"
     else
       image_tag 'default_profile_100.png', class: "dashboard-avatar img-responsive"
     end
  end

  def sport_picture(sport)
    if @sport.picture.exists?
       image_tag @sport.picture(:medium), class: "dashboard-sport-picture img-responsive"
     else
       image_tag 'avatar.png', class: "dashboard-sport-picture img-responsive"
     end
  end

  def user_picture_nav(current_user)
    @user = current_user
     if @user.picture.exists?
       image_tag @user.picture(:thumb), class: "dashboard-avatar img-responsive"
     else
       image_tag 'default_profile_30.png', class: "dashboard-avatar img-responsive"
     end
  end

end

