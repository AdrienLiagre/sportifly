module Groups
  class CommentsController < ApplicationController
    before_action :set_group

    def new
      @activity = Activity.find(params[:activity_id])
      @booking = Booking.find(params[:booking_id])
      @comment = Comment.new
    end

    def create
      @activity = @group.activities.find(params[:id])
      @booking = @activity.bookings.find(params[:id])
      @comment = @booking.comments.create(booking_params)
      @comment.save

      # if @comment.save
      #   redirect_to group_activity_path
      # else
      #   render :new
      # end
    end

  private

    def set_group
      @group = Group.friendly.find(params[:group])
    end

    def booking_params
      params.require(:booking).permit(:booking_id, :current_user, :content)
    end
  end
end
