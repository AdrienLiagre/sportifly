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

      if @activity.user_booked?(current_user)
        @comment  = @booking.comments.new(booking_params)
        @comment.save
        redirect_to group_activity_path(params[:group], @activity)
      elsif
        flash[:notice] = 'Tu dois flyer cette activité si tu veux la commenter'
        redirect_to group_activity_path(params[:group], @activity)
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
