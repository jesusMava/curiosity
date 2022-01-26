# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :curiosity_card

  validates :message, length: { in: 4..250 }, presence: true
end
