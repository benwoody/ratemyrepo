github = YAML.load(File.read(Rails.root.join('config', 'github.yml')))[Rails.env]

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, github['client_id'], github['client_secret']
end
