# frozen_string_literal: true

class CuriosityCard < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
  has_many :statements, dependent: :destroy
  has_many :questions, dependent: :destroy

  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  validates :title, presence: true, length: { minimum: 7 }
  validates :content, presence: true
  validates :images, content_type: %i[png jpg jpeg]

  scope :published, -> { where.not(published_at: nil) }
  scope :unpublished, -> { where(published_at: nil) }
  scope :random_curiosities, lambda { |category|
    published.
      where(category_id: Category.where(name: category).select(:id)).order('RANDOM()').take(5)
  }

  def published?
    published_at.present?
  end

  def publish!
    update(published_at: DateTime.current)
  end

  def unpublish!
    update(published_at: nil)
  end

  def self.set_questions(game, category)
    random_curiosities(category).each do |q|
      Question.find_or_create_by(game_id: game, curiosity_card_id: q.id)
    end
  end
end
