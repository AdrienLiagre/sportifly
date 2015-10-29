module Groups
  class ActivitiesController < ApplicationController
    before_action :set_group

    def show
      @activity = @group.activities.find(params[:id])

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

  private

    def set_group
      @group = Group.friendly.find(params[:group])
    end

    def activity_params
      params.require(:activity).permit(:name, :description, :number_of_players, :date, :open, :price, :location_id, :sport_id)
    end
  end
end
