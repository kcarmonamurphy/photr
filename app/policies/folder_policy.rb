# frozen_string_literal: true

class FolderPolicy < ApplicationPolicy
  def index?
    allow_to_perform?
  end

  def show?
    allow_to_perform?
  end

  def create?
    allow_to_perform?
  end

  def update?
    allow_to_perform?
  end

  def destroy?
    allow_to_perform?
  end

  def allow_to_perform?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
