class RegistrationsController < Devise::RegistrationsController
  before_action :check_group_domain_name, only: :create

  protected

  def check_group_domain_name
    unless Group.find_by(email_domain_name: Mail::Address.new(params[:user][:email]).domain)
      flash[:notice] = "Votre groupe n'est pas créé, contactez nous"
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def after_sign_up_path_for(resource)
      "/users/sign_in"
  end

  def after_inactive_sign_up_path_for(resource)
      "/users/sign_in"
  end

end
