# frozen_string_literal: true

FactoryBot.define do
  factory :reaction do
    user
    curiosity_card
    statement { nil }
  end
end
