module Groups
  class HomeController < ApplicationController
    def show
      @newsfeed   = Newsfeed.new
      @group      = Group.friendly.find(params[:group])
      @newsfeeds  = @group.newsfeeds.order(created_at: :desc).limit(100)
      @activities = @group.activities.planned
      @city       = params[:city]


      if @city.present?
        @locations  = Location.near(@city)
        @activities = @activities.joins(:location).where(locations: { id: @locations.map(&:id) })

        if @activities.empty?
          flash[:notice] = "Désolé, il n'y a rien de prévu à #{@city} pour le moment !"
          redirect_to group_root_path(current_user.group)
        end
      end

      @locations = Location.joins(:activities).where(activities: { id: @activities.pluck(:id) })

      # Let's DYNAMICALLY build the markers for the view.
      @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
        marker.lat location.latitude
        marker.lng location.longitude
        marker.infowindow render_to_string(partial: 'groups/shared/map_box', locals: { location: location })
      end
    end
  end
end
