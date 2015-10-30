module Groups
  class UsersController < ApplicationController
    before_action :set_group


    def show
      @user = @group.users.find(params[:id])
    end


  private

    def set_group
      @group = Group.friendly.find(params[:group])
    end


  end
end
