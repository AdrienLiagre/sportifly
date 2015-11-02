module Groups
  class CommentsController < ApplicationController
    before_action :set_group

    def new
      @activity = Activity.find(params[:activity_id])
      @booking  = Booking.find(params[:booking_id])
      @comment  = Comment.new
    end

    def create
      @activity = @group.activities.find(params[:activity_id])
      @booking  = @activity.bookings.for_user(current_user).first
      @comment  = @booking.comments.new(booking_params)

      if @comment.save
        redirect_to group_activity_path(params[:group], @activity)
      else
        render :new
      end
    end

  private

    def set_group
      @group = Group.friendly.find(params[:group])
    end

    def booking_params
      params.require(:comment).permit(:content)
    end
  end
end
