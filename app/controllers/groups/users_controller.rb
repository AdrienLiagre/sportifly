module Groups
  class UsersController < ApplicationController
    before_action :set_group

    def show


      if params[:query].present?
        @user = User.search(params[:query])
      else
        @user = @group.users.find(params[:id])
      end
    end

    def index
      @users = @group.users.all
      @email = params[:email]
      @user = current_user

      if @email
        UserMailer.invitation(@email, @user).deliver_now
      end
    end

  private
    def autocomplete
      render json: User.search(params[:query], autocomplete: true).map(&:name)
    end


    def set_group
      @group = Group.friendly.find(params[:group])
    end

  end
end
