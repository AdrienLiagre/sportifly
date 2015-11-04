module Groups
  module Activities
    class LocationsController < ApplicationController
      before_action :set_activity

      def new
        @location = Location.new
        @location.location_sports.build
      end

      def create
        @location = Location.new(location_params)

        if Location.where(address: @location.address).exists?
          redirect_to group_activity_path(current_user.group, @activity)
          flash[:error] = 'Ce club existe déjà, sélectionne le !'
        elsif @location.save
          @activity.update(location: @location)
          redirect_to group_activity_path(current_user.group, @activity)
          flash[:notice] = 'Le club a bien été créé'
        else
          flash[:error] = 'Impossible de créer le club.'
          render :new
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

      def set_activity
        @activity = Activity.where(captain: current_user).find(params[:activity_id])
      end
    end
  end
end
