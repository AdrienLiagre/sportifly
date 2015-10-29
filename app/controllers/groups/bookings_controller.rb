module Groups
  class BookingsController < ApplicationController
    before_action :set_group, only: :create

    def new
      @activity = Activity.find(params[:activity_id])
      @booking = Booking.new
    end

    def create
      @activity = @group.activities.find(params[:activity_id])
      @booking = @activity.bookings.create(user: current_user)

      if @activity.full?
        flash[:error] = 'Activity is full!'
        redirect_to group_root_path(params[:group])
      elsif @activity.save
        flash[:notice] = 'You successfully subscribed'
        redirect_to group_root_path(params[:group])
       else
        flash[:error] = 'An error occured'
        redirect_to group_root_path(params[:group])
      end
    end


    def destroy
      @booking = current_user.booking.find(params[:id])
      @booking.destroy
      redirect_to group_activity_path
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
