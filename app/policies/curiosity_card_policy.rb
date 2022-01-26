# frozen_string_literal: true

class CuriosityCardPolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
    true
  end

  def update?
    owner_or_admin?
  end

  def destroy?
    owner_or_admin?
  end
end
