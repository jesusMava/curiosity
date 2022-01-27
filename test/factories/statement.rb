# frozen_string_literal: true

FactoryBot.define do
  factory :statement do
    user
    curiosity_card
    is_real { true }
  end
end
