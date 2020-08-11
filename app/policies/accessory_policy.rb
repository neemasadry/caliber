class AccessoryPolicy < ApplicationPolicy

  def collect?
    return true if user.present? && !@user_on_personal_account
    false
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
