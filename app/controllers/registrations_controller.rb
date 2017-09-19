class RegistrationsController < Devise::RegistrationsController
  before_action :check_group_domain_name, only: :create

  protected

  def check_group_domain_name
    if Token.where(mail:params[:user][:email]).count > 0 
      flash[:notice] = "Vous avez été invité."
    elsif Group.where(email_domain_name: Mail::Address.new(params[:user][:email]).domain).count < 1
      flash[:notice] = t('users.sign_in.invalid')     
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

