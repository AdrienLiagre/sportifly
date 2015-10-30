module ApplicationHelper



  def user_picture(user)
    @user = user
     if @user.picture.exists?
       image_tag @user.picture(:thumb), class: "img-responsive dashboard-avatar rounded"
     else
       image_tag 'jcdusse.png', class: "img-responsive dashboard-avatar"
     end
  end
end
