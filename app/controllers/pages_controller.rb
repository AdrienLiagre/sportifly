class PagesController < ApplicationController

  def home
    if user_signed_in?
      redirect_to group_root_path(current_user.group)
    end
  end

  def show
    @locations = Location.all
      # Let's DYNAMICALLY build the markers for the view.
    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
      marker.infowindow render_to_string(:partial => "/groups/shared/map_box", locals: {location: location})
    end

  end

end
