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

    def upvote
      @newsfeed = Newsfeed.find(params[:id])
      respond_to do |format|
      unless @newsfeed.upvote_from current_user
        format.html { redirect_to :back }
        format.json { head :no_content }
        format.js { render :layout => false }
        @newsfeed.vote_total = @newsfeed.vote_total + 1
        @newsfeed.save
        @newsfeed.upvote_by current_user
      else
        flash[:danger] = 'You allready voted this entry'
        format.html { redirect_to :back }
        format.json { head :no_content }
        format.js
      end
     end
    end

    def downvote
      @newsfeed = Newsfeed.find(params[:id])
      respond_to do |format|
      unless @newsfeed.downvote_from current_user
        format.html { redirect_to :back }
        format.json { head :no_content }
        format.js { render :layout => false }
        @newsfeed.vote_total = @newsfeed.vote_total + 1
        @newsfeed.save
        @newsfeed.downvote_by current_user
      else
        flash[:danger] = 'You allready voted this entry'
        format.html { redirect_to :back }
        format.json { head :no_content }
        format.js
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
