Rails.application.config.middleware.use OmniAuth::Builder do
  provider :hack_club,
    ENV["HACKCLUB_CLIENT_ID"],
    ENV["HACKCLUB_CLIENT_SECRET"],
    scope: "openid slack_id"
end

OmniAuth.config.allowed_request_methods = [:post]
