class CuriosityCard < ApplicationRecord
  validates :title, presence: true, length: { minimum: 7 }
  validates :content, presence: true, length: { in: 10..200 }

  belongs_to :user

  has_many_attached :images

  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
end
