# frozen_string_literal: true

class Statement < ApplicationRecord
  belongs_to :curiosity_card
  belongs_to :user

  validates :user_id, uniqueness: { scope: :curiosity_card_id,
                                    message: 'should happen once per reaction' }
  validates :is_real, inclusion: { in: [true, false],
                                   message: 'is_real should be true or false' }
end
