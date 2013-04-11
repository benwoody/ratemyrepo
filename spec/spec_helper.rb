require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.

  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'capybara/rspec'
  require 'webmock/rspec'
  require 'rspec/rails'
  require 'rspec/autorun'

  OmniAuth.config.test_mode = true
  OmniAuth.config.logger = Rails.logger

end

Spork.each_run do
  # This code will be run each time you run your specs.
  load "#{Rails.root}/config/routes.rb"
  Dir["#{Rails.root}/app/**/*.rb"].each {|f| load f}
  Dir["#{Rails.root}/lib/**/*.rb"].each {|f| load f}
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  FactoryGirl.reload

  # This code will be run each time you run your specs.
  RSpec.configure do |config|
    config.mock_with :rspec
    config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = true
    config.infer_base_class_for_anonymous_controllers = false
    config.include AuthenticationHelpers, :type => :request
    config.include RequestHelpers, :type => :request
    config.order = "random"
  end

end
