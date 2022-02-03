# frozen_string_literal: true

class QuestionPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def update?
    record.game.user == user
  end
end
