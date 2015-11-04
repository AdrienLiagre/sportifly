module Groups
  class LocationsController < ApplicationController

    def new
      @location = Location.new
      @location.location_sports.build
    end

    def create
      @location = Location.new(location_params)

      if Location.where(address: @location.address).exists?
        flash[:error] = 'Ce club existe déjà !'
        render :new
      elsif @location.save
        flash[:notice] = 'Le club a bien été créé'
        redirect_to group_root_path
      else
        flash[:error] = 'Impossible de créer le club.'
        render :new
      end
    end

    def index
      @locations = Location.all
      # Let's DYNAMICALLY build the markers for the view.
      @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
        marker.lat location.latitude
        marker.lng location.longitude
        marker.infowindow render_to_string(:partial => "/groups/shared/map_box", locals: {location: location})
      end
    end

    private

    def location_params
      params.require(:location).permit(
        :name,
        :address,
        :city,
        :postcode,
        location_sports_attributes: [:sport_id]
      )
    end
  end
end
