# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :questions, dependent: :destroy

  after_create_commit :setup

  scope :top, ->(limit) { select(:total_score, :user_id).distinct.order('total_score DESC').limit(limit) }

  def update_total_score
    update(total_score: questions.sum(:score))
  end

  def completed?
    !incomplete?
  end

  def incomplete?
    questions.exists?(answer: nil)
  end

  def previous_question
    questions.answered.order(updated_at: :desc).first
  end

  def next_question
    questions.unanswered.order('RANDOM()').first
  end

  private

  def setup
    CuriosityCard.random_curiosities(category).each do |card|
      questions.create(curiosity_card: card)
    end
  end
end
