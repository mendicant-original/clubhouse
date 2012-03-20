ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/spec'
require 'capybara/rails'

Dir[File.expand_path('../support/*.rb', __FILE__)].each { |file| require file }

DatabaseCleaner.strategy = :truncation
class MiniTest::Spec
  before :each do
    DatabaseCleaner.clean
  end
end

class RequestSpec < MiniTest::Spec
  include Rails.application.routes.url_helpers
  include Capybara::DSL
  include TestSupport::Integration
end

MiniTest::Spec.register_spec_type /integration$/i, RequestSpec
