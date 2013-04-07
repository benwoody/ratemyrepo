
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, GITHUB[:client_id], GITHUB[:client_secret]
end
