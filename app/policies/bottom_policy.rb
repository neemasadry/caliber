class BottomPolicy < ProductPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
