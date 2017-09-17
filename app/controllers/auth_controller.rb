class AuthController < ApplicationController

	def gettoken
		token = get_token_from_code params[:code]
		session[:azure_token] = token.to_hash
		session[:user_email] = get_user_email token.token
		render text: "Access token saved in session cookie."
	end
end