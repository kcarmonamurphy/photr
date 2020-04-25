# frozen_string_literal: true

class ImagePolicy < ApplicationPolicy
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

  def upload_attachment?
    allow_to_perform?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
