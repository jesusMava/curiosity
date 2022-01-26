# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'faker'
require 'support/factory_bot'
require 'support/policy_asserts'
require 'active_storage_validations/matchers'

module ActiveSupport
  class TestCase
    include PolicyAsserts
    include Devise::Test::IntegrationHelpers

    extend ActiveStorageValidations::Matchers

    parallelize(workers: :number_of_processors)

    Shoulda::Matchers.configure do |config|
      config.integrate do |with|
        with.test_framework :minitest
        with.library :rails
      end
    end
  end
end
