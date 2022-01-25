class CuriosityCardPolicy < ApplicationPolicy
  def show?
    true
  end

  def edit?
    record.user == user || user.admin?
  end

  def new?
    user.present?
  end

  def create?
    user.present?
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user || user.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
