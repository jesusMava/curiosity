# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :curiosity_cards, dependent: :destroy

  validates :name, presence: true
end
