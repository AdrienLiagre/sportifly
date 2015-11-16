module Groups
  class UsersController < ApplicationController
    before_action :set_group

    def show
      @user = @group.users.find(params[:id])
    end

    def index
      @users = @group.users.all
    end

  private

    def set_group
      @group = Group.friendly.find(params[:group])
    end

  end
end
