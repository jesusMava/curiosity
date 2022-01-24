class CuriosityCard < ApplicationRecord
  validates :title, presence: true, length: { minimum: 7 }
  validates :content, presence: true, length: { in: 10..200 }
  validates :images, content_type: [:png, :jpg, :jpeg]

  belongs_to :user

  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  has_many :comments, dependent: :destroy
  has_many :users, through: :comments

  enum action: { fake: 0, real: 1 }

  scope :order_curiosity_by_desc, -> { order('created_at Desc') }
end
