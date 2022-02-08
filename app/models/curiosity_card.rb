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

  scope :published, -> { where.not(published_at: nil).order(published_at: :desc) }
  scope :unpublished, -> { where(published_at: nil) }
  scope :random_curiosities, lambda { |category|
    published.
      where(category: category).order('RANDOM()').take(5)
  }

  scope :search, ->(text = nil) { text.nil? ? all : where('title LIKE ?', "%#{text}%") }

  def published?
    published_at.present?
  end

  def publish!
    update(published_at: DateTime.current)
  end

  def unpublish!
    update(published_at: nil)
  end

  def statement_exists?(user)
    statements.exists?(user: user)
  end

  def selected_by?(user)
    statements.find_by(user: user).is_real
  end
end
