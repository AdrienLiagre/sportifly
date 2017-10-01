class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
  before_action :authenticate_user!, unless: :admin_area?
  protect_from_forgery with: :exception
  before_action :set_locale

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

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

  private

  def admin_area?
    controller_path.start_with?('admin')
  end
end


