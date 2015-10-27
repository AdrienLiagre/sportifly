module Groups
  class HomeController < ApplicationController
    def show
      @group      = Group.friendly.find(params[:group])
      @activities = @group.activities
      @newsfeeds  = @group.newsfeeds
    end
  end
end
