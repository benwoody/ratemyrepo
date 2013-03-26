Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'defc3a74b6', '195ed06a7a430b87f01f31'
end
