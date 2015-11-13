class RegistrationsController < Devise::RegistrationsController
  before_action :check_group_domain_name, only: :create

  protected

  def check_group_domain_name
    unless Group.find_by(email_domain_name: Mail::Address.new(params[:user][:email]).domain)
      flash[:notice] = "Votre groupe n'est pas créé, contactez nous"
    end
  end
end
