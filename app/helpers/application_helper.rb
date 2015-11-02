module ApplicationHelper



  def user_picture(user)
    @user = user
     if @user.picture.exists?
       image_tag @user.picture(:medium), class: "dashboard-avatar img-responsive"
     else
       image_tag 'avatar.png', class: "dashboard-avatar img-responsive"
     end
  end

  def sport_picture(sport)
    if @sport.picture.exists?
       image_tag @sport.picture(:medium), class: "dashboard-sport-picture img-responsive"
     else
       image_tag 'avatar.png', class: "dashboard-sport-picture img-responsive"
     end
  end
end
