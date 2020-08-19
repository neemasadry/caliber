class GuidePolicy < ApplicationPolicy

  def like?
    return true if user.present?
    false
  end

  def favorite?
    return true if user.present?
    false
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
