# frozen_string_literal: true

class CuriosityCard < ApplicationRecord
  validates :title, presence: true, length: { minimum: 7 }
  validates :content, presence: true
  validates :images, content_type: %i[png jpg jpeg]

  belongs_to :user

  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  has_many :comments, dependent: :destroy
  has_many :users, through: :comments

  enum action: { fake: 0, real: 1 }
end
