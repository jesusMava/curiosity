# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy

  def self.create_game(user)
    create(user: user)
  end

  def self.update_total_score(game_id)
    sum_score = Question.where(game_id: game_id).sum(:score)
    game = Game.find(game_id)
    game.update(total_score: sum_score)
    game.total_score
  end
end
