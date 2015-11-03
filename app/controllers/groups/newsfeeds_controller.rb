module Groups
  class NewsfeedsController < ApplicationController
    before_action :set_group

    def new
      @user = current_user
      @newsfeed = Newsfeed.new
    end

    def create
      @user = current_user
      @newsfeed = @group.newsfeeds.new(newsfeed_params)
      @newsfeed.user = current_user
      if @newsfeed.save
        redirect_to group_root_path(params[:group])
      elsif
        redirect_to group_root_path(params[:group])
      end
    end

  private

    def set_group
      @group = Group.friendly.find(params[:group])
    end

    def newsfeed_params
      params.require(:newsfeed).permit(:content, :picture)
    end
  end
end
