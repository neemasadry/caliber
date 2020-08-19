class ProductPolicy < ApplicationPolicy
  # Policy for: Accessory, Bottom, Cosmetic, Dress, Fragrance, Jewelry, Shoe, Top

  def index?
    true
  end

  def show?
    true
  end

  def create?
    return true if user.present? && !@user_on_personal_account
    false
  end

  def new?
    create?
  end

  def update?
    return true if user.present? && record.user == user && !@user_on_personal_account
    false
  end

  def edit?
    update?
  end

  def destroy?
    return true if user.present? && record.user == user && !@user_on_personal_account
    false
  end

  def like?
    return true if user.present? && @user_on_personal_account
    false
  end

  def favorite?
    return true if user.present? && @user_on_personal_account
    false
  end

  def collect?
    return true if user.present? && @user_on_personal_account
    false
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
