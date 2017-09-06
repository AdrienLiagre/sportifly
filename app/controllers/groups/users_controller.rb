module Groups
  class UsersController < ApplicationController
    before_action :set_group

    def show
      @user = @group.users.find(params[:id])
    end

    def block
      if User.where(id:params[:user_id]).first.allowed_to_log_in == true
        User.update(params[:user_id], allowed_to_log_in:false)
      else
        User.update(params[:user_id], allowed_to_log_in:true)
      end
      puts("Bonhomme bloqué")
      respond_to do |format|
        format.js {render js: 'window.location.reload();'}
      end
    end

    def index
      @users   = @group.users.all
      @email   = params[:email]
      @user    = current_user
      @group   = Group.friendly.find(params[:group])

      if @email
        if @email.include?(@group.email_domain_name.downcase)
          UserMailer.invitation(@email, @user).deliver_now
          flash[:notice] = "Invitation envoyée"
          redirect_to :back

        else
          Token.create(group_id:current_user.group_id,mail:@email,token_string:"trololo",original_id:current_user.id)
          UserMailer.invitation(@email, @user).deliver_now
          flash[:alert] = "Invitation envoyée"
          redirect_to :back
        end

      end
    end

   def autocomplete
      render json: User.search(params[:query], autocomplete: true, limit: 10).map(&:name)
   end
  private

    def set_group
      @group = Group.friendly.find(params[:group])
    end

  end
end
