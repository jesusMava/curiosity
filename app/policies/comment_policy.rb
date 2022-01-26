class CommentPolicy < ApplicationPolicy
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
