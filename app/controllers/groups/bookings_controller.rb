module Groups
  class BookingsController < ApplicationController
    before_action :set_group, only: [:create, :destroy]

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
      @activity = @group.activities.find(params[:activity_id])
      @booking = @activity.bookings.where(user: current_user)
      @booking.destroy(booking)
      redirect_to group_root_path


      # normalement ca marche, mais dans la logique, ou un user, beut booker une seule fois.
      # or a ce stade un meme user peut booker plein de fois une meme activité
      # donc cette methode destroy ne marche pas encore

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
