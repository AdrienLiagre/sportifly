module Groups
  class BookingsController < ApplicationController
    before_action :set_group, only: [:create, :destroy]

    def new
      @activity = Activity.find(params[:activity_id])
      @booking  = Booking.new
    end

    def create
      @activity   = @group.activities.find(params[:activity_id])

      if params[:user]
        @invited  = User.find(params[:user].to_i)
        @booking  = @activity.bookings.new(user: @invited, status: :pending)
      else
        @booking  = @activity.bookings.new(user: current_user)
      end

      if @activity.full?
        flash[:error] = 'Activité complète!'
      elsif @activity.user_booked?(current_user)
        flash[:error] = "Tu fly déjà cette activité"
      elsif @activity.save
        if params[:user]
          flash[:notice] = "Invitation envoyée"
        else
          flash[:notice] = "Booking confirmé"
        end
      else
        flash[:error] = 'Un problème a été détecté'
      end

      if params[:referral] == 'activity-page'
        redirect_to group_activity_path(@group, @activity)
      else
        redirect_to group_root_path(params[:group])
      end
    end

    def update
      @booking = Booking.find(params[:id])
      change(@booking)
      @activity = @booking.activity

      redirect_to group_activity_path(@activity.group, @activity)
    end

    def destroy
      @activity = @group.activities.find(params[:activity_id])
      @booking  = @activity.bookings.for_user(current_user).first

      @booking.destroy

      if params[:referral] == 'activity-page'
        redirect_to group_activity_path(@group, @activity)
      elsif params[:referral] == 'dashboard-page'
        redirect_to account_dashboard_path
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

    def change(booking)
      booking.update(status: :confirmed)
    end
  end
end
