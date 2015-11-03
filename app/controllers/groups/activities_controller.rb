module Groups
  class ActivitiesController < ApplicationController
    before_action :set_group

    def index
      @activities = @group.activities.all
    end

    def show
      @activity = @group.activities.find(params[:id])
      @comments = @activity.comments

      @locations = Location.all

      # Let's DYNAMICALLY build the markers for the view.
      @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
        marker.lat location.latitude
        marker.lng location.longitude
        marker.infowindow render_to_string(:partial => "/groups/shared/map_box", locals: {location: location})
      end

    end

    def new
      @activity = @group.activities.new
      @activity.captain = current_user
    end

    def create
      @activity = @group.activities.new(activity_params)
      @activity.captain = current_user

      if @activity.save
        redirect_to group_root_path
      else
        render :new
      end
    end

    def destroy
      @activity = @group.activities.find(params[:id])
      @activity.destroy
      redirect_to group_root_path(@group.slug)
    end

    def activitycreation
      @activity = Activity.new
    end

  private

    def set_group
      @group = Group.friendly.find(params[:group])
    end

    def activity_params
      params.require(:activity).permit(:name, :description, :number_of_players, :date, :open, :price, :location_id, :sport_id)
    end
  end
end
