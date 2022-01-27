# frozen_string_literal: true

class Reaction < ApplicationRecord
  belongs_to :curiosity_card
  belongs_to :user

  validates :user_id, uniqueness: { scope: :curiosity_card_id,
                                    message: 'should happen once per reaction' }
end
