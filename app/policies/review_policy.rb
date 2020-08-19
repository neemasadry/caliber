class ReviewPolicy < ApplicationPolicy

  def create?
    return true if user.present? && @user_on_personal_account
    false
  end

  def update?
    return true if user.present? && record.user == user && @user_on_personal_account
    false
  end

  def destroy?
    return true if user.present? && record.user == user && @user_on_personal_account
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
