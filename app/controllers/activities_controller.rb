class ActivitiesController < ApplicationController

  def pin
  	activity_e = Activity.where(id:params[:id]).first
  	if activity_e.pinned == false
    	Activity.where(group_id: activity_e.group_id).update_all(pinned:false)
    	Activity.update(params[:id], pinned:true)
    else
    	Activity.update(params[:id], pinned:false)
    end
    render :nothing => true
  end
end
