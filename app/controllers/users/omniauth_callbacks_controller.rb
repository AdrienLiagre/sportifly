class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def google_oauth2
		@user = User.from_google(request.env['omniauth.auth'])
		puts(request.env['omniauth.auth'].inspect)
		if @user.persisted?
			sign_in_and_redirect @user, event: :authentification
		else
			session['devise.google.email'] = request.env['omniauth.auth'].info.email
			session['devise.google.name'] = request.env['omniauth.auth'].info.name
			redirect_to new_user_registration_url
		end

	end

	  def assign_to_group
	    if self.email.include?("stationf")
	      self.group = Group.find_by(email_domain_name: "stationf.co")
	    elsif self.email.include?("thalasseo")
	      self.group = Group.find_by(email_domain_name: "voyageprive.com")
	    elsif Token.where(mail: self.email).count > 0
	      user_t = Token.where(mail: self.email).first.group_id
	      self.group = Group.find_by(id:user_t)
	    else
	      self.group = Group.find_by(email_domain_name: Mail::Address.new(self.email).domain)
	    end
	  end

end