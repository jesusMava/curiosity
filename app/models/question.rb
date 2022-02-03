# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :game
  belongs_to :curiosity_card

  def self.answer_question(question, response)
    question.update(answer: response)
    question.update(score: 20) if question.curiosity_card.truthful == question.answer
  end

  def self.take_questions(game)
    Question.where(game_id: game).where(answer: nil).take(5)
  end
end
