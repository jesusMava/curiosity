# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    game
    curiosity_card
    score { 0 }
    answer { true }
  end
end
