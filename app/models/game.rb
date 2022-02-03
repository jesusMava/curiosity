# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :questions, dependent: :destroy

  after_create_commit :setup

  def update_total_score
    update(total_score: questions.sum(:score))
  end

  private

  def setup
    CuriosityCard.random_curiosities(category).each do |card|
      questions.create(curiosity_card: card)
    end
  end
end
