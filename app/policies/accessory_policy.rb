class AccessoryPolicy < ApplicationPolicy

  def like?
    return true if user.present? && user.personal_account.present?
    false
  end

  def favorite?
    return true if user.present? && user.personal_account.present?
    false
  end

  def collect?
    return true if user.present? && user.personal_account.present?
    false
  end

  def outfit?
    return true if user.present?
    false
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
