
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["OAUTH_ID"],ENV["OAUTH_SECRET"], callback_path: '/auth/google/callback' 
end

OmniAuth.config.allowed_request_methods = [:post, :get]


