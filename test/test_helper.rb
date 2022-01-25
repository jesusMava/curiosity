# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'faker'
require 'support/factory_bot'
require 'active_storage_validations/matchers'

module ActiveSupport
  class TestCase
    extend ActiveStorageValidations::Matchers
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    include Devise::Test::IntegrationHelpers

    Shoulda::Matchers.configure do |config|
      config.integrate do |with|
        with.test_framework :minitest
        with.library :rails
      end
    end

    def assert_permit(user, record, action)
      msg = "User #{user.inspect} should be permitted to #{action} #{record}, but isn't permitted"
      assert permit(user, record, action), msg
    end

    def refute_permit(user, record, action)
      msg = "User #{user.inspect} should NOT be permitted to #{action} #{record}, but is permitted"
      assert_not permit(user, record, action), msg
    end

    def permit(user, record, action)
      index = self.class.name.index('Policy')
      klass = self.class.name[0, index + 6]
      klass.constantize.new(user, record).public_send("#{action}?")
    end
  end
end
