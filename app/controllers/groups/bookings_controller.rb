module Groups
  class BookingsController < ApplicationController
    before_action :set_group, only: [:create, :destroy]

    def new
      @activity = Activity.find(params[:activity_id])
      @booking  = Booking.new
    end

    def create
      @activity   = @group.activities.find(params[:activity_id])
      @user       = current_user
      @group      = Group.friendly.find(params[:group])


      if params[:user]
        @invited  = User.find(params[:user].to_i)
        @email = @invited.email
        @booking  = @activity.bookings.new(user: @invited, status: :pending, inviter: current_user.name)
        UserMailer.activity(@email, @user, @activity, @group).deliver_now

      else
        @booking  = @activity.bookings.new(user: current_user)
      end

      if @activity.full?
        flash[:error] = t'booking.full'
      elsif @activity.user_booked?(current_user)
        flash[:error] = t'booking.already_flied'
      elsif @activity.save
        if params[:user]
          flash[:notice] = t'booking.send_invit'
        else
          flash[:notice] = t'booking.confirm'
        end
      else
        flash[:error] = t'booking.problem'
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
