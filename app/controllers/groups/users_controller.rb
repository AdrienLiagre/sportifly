module Groups
  class UsersController < ApplicationController
    before_action :set_group

    def show
      @user = @group.users.find(params[:id])
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

    def set_group
      @group = Group.friendly.find(params[:group])
    end

  end
end
