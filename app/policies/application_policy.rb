class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

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
    return true if user.present? && !@user_on_personal_account
    false
  end

  def edit?
    update?
  end

  def destroy?
    return true if user.present? && !@user_on_personal_account
    false
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
