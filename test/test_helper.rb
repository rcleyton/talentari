ENV["RAILS_ENV"] ||= "test"

require "simplecov"

SimpleCov.start "rails" do
  add_filter "/test/"
  add_filter "/config/"
  add_filter "/vendor/"
end

require_relative "../config/environment"
require "rails/test_help"
require "minitest/reporters"
require "minitest/spec"
require "capybara/rails"
require "capybara/minitest"

Minitest::Reporters.use! Minitest::Reporters::ProgressReporter.new

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Make the Capybara DSL available in all integration tests
    include Capybara::DSL
    # Make `assert_*` methods behave like Minitest assertions
    include Capybara::Minitest::Assertions

    # Reset sessions and driver between tests
    teardown do
      Capybara.reset_sessions!
      Capybara.use_default_driver
    end

    Capybara.configure do |config|
      config.save_path = Rails.root.join("tmp", "capybara")
    end
  end
end
