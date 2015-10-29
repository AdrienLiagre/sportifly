class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(user)
    group_root_path(user.group.slug)
   # '/an/example/path' # Or :prefix_to_your_route
  end
end
