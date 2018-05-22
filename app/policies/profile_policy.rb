class ProfilePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user_is_appentice?
  end

  def update?
    record.user == user || user_is_appentice?
  end

  def show?
    record.user == user || !user_is_appentice?
  end


private
def user_is_appentice?
  user.role == 'appentice'
end
end
