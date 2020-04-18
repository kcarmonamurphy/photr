# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    allow_to_perform?
  end

  def show?
    user == record || allow_to_perform?
  end

  def me?
    user.present?
    true
  end

  def create?
    allow_to_perform?
  end

  def update?
    allow_to_perform?
  end

  def allow_to_perform?
    true
  end

  class Scope < Scope
    def resolve
      return scope.where(id: user.id) if user.present?

      scope.none
    end
  end
end
