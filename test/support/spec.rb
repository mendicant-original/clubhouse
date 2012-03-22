require "support/integration"

module Support
  class IntegrationSpec < MiniTest::Spec
    include Rails.application.routes.url_helpers
    include Capybara::DSL
    include Integration

    DatabaseCleaner.strategy = :truncation

    before do
      DatabaseCleaner.start
      DatabaseCleaner.clean
    end

    after do
      Capybara.reset_sessions!
    end
  end

  class ControllerSpec < MiniTest::Spec
    include Rails.application.routes.url_helpers
    include ActiveSupport::Testing::SetupAndTeardown

    alias :method_name :__name__ if defined? :__name__

    include ActionController::TestCase::Behavior

    before { @routes = Rails.application.routes }
  end

  MiniTest::Spec.register_spec_type(/Integration$/i, Support::IntegrationSpec)
  MiniTest::Spec.register_spec_type(/Controller$/i, Support::ControllerSpec)
end
