# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    total_score { 0 }
    user
    category
  end
end
