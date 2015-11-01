module Groups
  class HomeController < ApplicationController

    def show
      @group      = Group.friendly.find(params[:group])
      @newsfeeds  = @group.newsfeeds

      if params[:user_input_city]
        @dbactivities = @group.activities
        @dbactivities.map do |a|
        @activities = @group.activities.locations.near(params[:user_input_city], 10)
        end
      else
        @activities = @group.activities
      end

      @locations = []

      @activities.map do |a|
        if a.date > Date.yesterday
          @locations << a.location if a.location != nil
        end
      end

      # Let's DYNAMICALLY build the markers for the view.
      @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
        marker.lat location.latitude
        marker.lng location.longitude
        marker.infowindow render_to_string(:partial => "/groups/shared/map_box", locals: {location: location})
      end
    end

  end
end
