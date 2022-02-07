# frozen_string_literal: true

class Statement < ApplicationRecord
  belongs_to :curiosity_card
  belongs_to :user

  validates :user_id, uniqueness: { scope: :curiosity_card_id,
                                    message: 'should happen once per reaction' }
  validates :is_real, inclusion: { in: [true, false],
                                   message: 'is_real should be true or false' }

  def self.upsert(**args)
    statement = find_or_initialize_by(user: args[:user], curiosity_card: args[:curiosity_card])
    statement.update(is_real: args[:is_real])
  end
end
