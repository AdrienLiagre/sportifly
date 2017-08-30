class FavoritesController < ApplicationController

  def addy
    Favorite.create(sport_id:params[:id],user_id:current_user.id,group_id:current_user.group_id,response:1)
    respond_to do |format|
      format.js {render js: 'window.location.reload();'}
    end
  end
  def addn
    Favorite.create(sport_id:params[:id],user_id:current_user.id,group_id:current_user.group_id,response:4)
    respond_to do |format|
      format.js {render js: 'window.location.reload();'}
    end
  end
end
