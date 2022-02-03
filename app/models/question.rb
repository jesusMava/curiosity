# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :game
  belongs_to :curiosity_card

  scope :answered, -> { where.not(answer: nil) }
  scope :unanswered, -> { where(answer: nil) }

  before_save :set_score

  def correct?
    curiosity_card.truthful == answer
  end

  private

  def set_score
    self.score = correct? ? 20 : 0
  end
end
