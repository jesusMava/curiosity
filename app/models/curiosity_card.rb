# frozen_string_literal: true

class CuriosityCard < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
  has_many :statements, dependent: :destroy

  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  validates :title, presence: true, length: { minimum: 7 }
  validates :content, presence: true
  validates :images, content_type: %i[png jpg jpeg]

  def published?
    published_at.present?
  end

  def publish!
    self.published_at = DateTime.current
  end
end
