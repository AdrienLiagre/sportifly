module Group
  class HomeController < ApplicationController
    def show
      @activities = Activity.all
      @newsfeeds = Newsfeed.all
    end
  end
end
