module Groups
  class CommentsController < ApplicationController
    before_action :set_group

    def new
      @activity = Activity.find(params[:activity_id])
      @booking = Booking.find(params[:booking_id])
      @comment = Comment.new
    end

    def create

      @booking = @group.activities.booking.find(params[:activity_id])
      @comment = @activity.booking.create(user: current_user)

      if @comment.save
        redirect_to group_activity_path
      else
        render :new
      end
    end

  private

    def set_group
      @group = Group.friendly.find(params[:group])
    end

    def appoint_params
      params.require(:booking).permit(:activity_id, :current_user)
    end
  end
end
