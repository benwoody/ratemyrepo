source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'jquery-rails'
gem 'simple_form', '~> 2.1.0'

gem 'omniauth-github'
gem 'github_api', '~> 0.9.4'

gem 'kaminari', '~> 0.14.1'

gem 'newrelic_rpm'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'

  gem 'rspec-rails', '~> 2.13.0'
  gem 'bootstrap-sass', '~> 2.3.1.0'
end

group :development do
  gem 'pry-rails', '~> 0.2.2'
  gem "better_errors", ">= 0.3.2"
  gem "binding_of_caller"
  gem 'unicorn-rails'
end

group :test do
  gem 'capybara', '~> 2.0.2'
  gem 'factory_girl_rails', '~> 4.2.1'

  gem 'webmock'

  gem 'spork-rails', '~> 3.2.1'
  gem 'guard', '~> 1.6.2'
  gem 'guard-bundler'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'guard-livereload'

  gem 'rb-inotify', '~> 0.9.0', :require => false
  gem 'libnotify', :require => false

  gem 'growl', :require => false
  gem "rb-fsevent", "~> 0.9.3", :require => false
end

group :production do
  gem 'pg', '~> 0.14.1'
end

