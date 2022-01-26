# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    message { Faker::Lorem.characters(number: 250) }
    user
    curiosity_card
  end
end
