module Groups
  class BookingsController < ApplicationController
    before_action :set_group, only: [:create, :destroy]

    def new
      @activity = Activity.find(params[:activity_id])
      @booking  = Booking.new
    end

    def create
      @activity = @group.activities.find(params[:activity_id])
      @booking  = @activity.bookings.new(user: current_user)

      if @activity.full?
        flash[:error] = 'Activity is full!'
      elsif @activity.user_booked?(current_user)
        flash[:error] = 'You already booked'
      elsif @activity.save
        flash[:notice] = 'You successfully subscribed'
      else
        flash[:error] = 'An error occured'
      end

      if params[:referral] == 'activity-page'
        redirect_to group_activity_path(@group, @activity)
      else
        redirect_to group_root_path(params[:group])
      end
    end

    def destroy
      @activity = @group.activities.find(params[:activity_id])
      @booking  = @activity.bookings.for_user(current_user).first

      @booking.destroy

      if params[:referral] == 'activity-page'
        redirect_to group_activity_path(@group, @activity)
      else
        redirect_to group_root_path
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
