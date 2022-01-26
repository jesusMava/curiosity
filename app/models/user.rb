# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :curiosity_cards, dependent: :destroy

  has_many :comments, dependent: :destroy

  enum role: { basic: 0, admin: 1 }
end
