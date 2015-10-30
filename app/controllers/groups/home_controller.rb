module Groups
  class HomeController < ApplicationController

    def show
      @group      = Group.friendly.find(params[:group])
      @activities = @group.activities
      @newsfeeds  = @group.newsfeeds

      @locations = @activities.map { |a| a.location }
      # Let's DYNAMICALLY build the markers for the view.
      @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
        marker.lat location.latitude
        marker.lng location.longitude
        marker.infowindow render_to_string(:partial => "/groups/shared/map_box", locals: {location: location})
      end
    end

  end
end
