module Groups
  class ActivitiesController < ApplicationController
    before_action :set_group
    before_action :set_activity, only: [:show, :edit, :update, :destroy]

    def index
      @activities = @group.activities.all
    end

    def show
      @activity = @group.activities.find(params[:id])
      @comments = @activity.comments.order(created_at: :desc).limit(15)
      @user             = current_user
      @bookings_planned = @user.bookings.planned
      @bookings_passed  = @user.bookings.passed

      @locations = Location.all
      # Let's DYNAMICALLY build the markers for the view.
      @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
        marker.lat location.latitude
        marker.lng location.longitude
        marker.infowindow render_to_string(:partial => "/groups/shared/map_box", locals: {location: location})
      end


      if params[:query].present?
        @number_of_results = User.search(params[:query]).hits.length
        @users_all = User.search(params[:query]).first(@number_of_results)
        @users = @users_all.select { |user| user.group_id == @group.id}
        # redirect_to group_user_path(@group, @user)
        # render :json => @user.to_json
      else

        puts 'find someone'
      end

    end

    def new
      @activity = @group.activities.new
      @activity.captain = current_user
      @booking = Booking.new
    end

    def create
      @activity = @group.activities.new(activity_params)
      @activity.captain = current_user
      @activity.bookings.new(user: @activity.captain)

      if @activity.save

        redirect_to group_activity_path(@group, @activity)
        flash[:notice] = t'activity.new.notice_location'
      else
        render :new
      end
    end

    def autocomplete
      render json: User.search(params[:query], autocomplete: true, limit: 10).map(&:name)
    end

    def edit
      @activity = @group.activities.find(params[:id])
    end

    def update
      @activity = @group.activities.find(params[:id])
      # authorize @user
      @activity.update(activity_params)
      redirect_to group_activity_path(@group, @activity)
    end

    def destroy
      @activity.destroy
      redirect_to group_root_path(@group.slug)
    end

  private


    def set_group
      @group = Group.friendly.find(params[:group])
    end

    def set_activity
      @activity = @group.activities.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(:name, :sport_id, :number_of_players, :date, :description, :open, :price, :location_id)
    end
  end
end
