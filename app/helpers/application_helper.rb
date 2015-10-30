module ApplicationHelper



  def user_picture(user)
    @user = user
     if @user.picture.exists?
       image_tag @user.picture(:medium), class: "dashboard-avatar img-responsive"
     else
       image_tag 'jcdusse.png', class: "dashboard-avatar img-responsive"
     end
  end
end
