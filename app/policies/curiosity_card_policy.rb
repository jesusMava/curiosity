# frozen_string_literal: true

class CuriosityCardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user&.admin?
        scope.all
      else
        scope.published
      end
    end
  end

  def index?
    true
  end

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

  def permitted_attributes
    if admin?
      [:title, :content, :category_id, :published_at, :extra_comments, :truthful, { images: [] }]
    else
      [:title, :content, :category_id, { images: [] }]
    end
  end
end
