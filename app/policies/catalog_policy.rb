class CatalogPolicy < ApplicationPolicy

  def like?
    return true if user.present? && !@user_on_personal_account
    false
  end

  def favroite?
    return true if user.present? && !@user_on_personal_account
    false
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
