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
      # @newsfeed = @group.newsfeeds.select do |newsfeed|
      #   newsfeed.persisted?
      # end


      if @newsfeed.save
        respond_to do |format|
          format.html { redirect_to group_root_path(params[:group]) }
          format.js  { }
        end
      else
        respond_to do |format|
          format.html { 'render groups/home/shownews' }
          format.js  # <-- idem
        end
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
