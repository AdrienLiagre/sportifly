class PagesController < ApplicationController
  skip_before_filter :authenticate_user!
  layout "creative"

  def home
    @contact = Contact.new
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

  def contact
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.valid?
        UserMailer.contact(@contact).deliver_now
        flash.now[:error] = nil
        redirect_to :controller => 'pages', :action => 'create'
    else
      flash[:alert] = 'Cannot send message'
      render :home
    end
  end

  def create

  end


end
