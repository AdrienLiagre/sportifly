module AuthHelper

# App's client ID. Register the app in Application Registration Portal to get this value.
CLIENT_ID = '82585ccd-c10c-485d-af85-ebe22e411be1'
# App's client secret. Register the app in Application Registration Portal to get this value.
CLIENT_SECRET = 'J69JGFBMfqNWa2sV8OFMueq'

# Scopes required by the app
SCOPES = [ 'openid',
	'profile',
	'User.Read',
	'Mail.Read' ]

REDIRECT_URI = 'http://localhost:3000/authorize' # Temporary!

# Generates the login URL for the app.
def get_login_url
	client = OAuth2::Client.new(CLIENT_ID,
		CLIENT_SECRET,
		:site => 'https://login.microsoftonline.com',
		:authorize_url => '/common/oauth2/v2.0/authorize',
		:token_url => '/common/oauth2/v2.0/token')

	login_url = client.auth_code.authorize_url(:redirect_uri => authorize_url, :scope => SCOPES.join(' '))
end

def get_token_from_code(auth_code)
	client = OAuth2::Client.new(CLIENT_ID,
		CLIENT_SECRET,
		:site => 'https://login.microsoftonline.com',
		:authorize_url => '/common/oauth2/v2.0/authorize',
		:token_url => '/common/oauth2/v2.0/token')

	token = client.auth_code.get_token(auth_code,
		:redirect_uri => authorize_url,
		:scope => SCOPES.join(' '))
end

# Gets the user's email from the /Me endpoint
def get_user_email(access_token)
	callback = Proc.new { |r| r.headers['Authorization'] = "Bearer #{access_token}"}

	graph = MicrosoftGraph.new(base_url: 'https://graph.microsoft.com/v1.0',
		cached_metadata_file: File.join(MicrosoftGraph::CACHED_METADATA_DIRECTORY, 'metadata_v1.0.xml'),
		&callback)

	me = graph.me
	email = me.mail
end

end