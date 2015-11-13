class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!, unless: :admin_area?
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    if user.is_a?(AdminUser)
      admin_root_path
    else
      group_root_path(user.group.slug)
    end
  end

  def default_url_options
    { host: ENV['HOST'] || 'localhost:3000' }
  end

  private

  def admin_area?
    controller_path.start_with?('admin')
  end
end
