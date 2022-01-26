# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    owner?
  end

  def destroy?
    owner_or_admin?
  end
end
