class GuidePolicy < ApplicationPolicy

  def update?
    return true if user.present? && record.user == user
    false
  end

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
