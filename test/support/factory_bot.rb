# frozen_string_literal: true

module ActiveSupport
  class TestCase
    include FactoryBot::Syntax::Methods
    FactoryBot.reload
  end
end
