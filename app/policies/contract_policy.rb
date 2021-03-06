class ContractPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
    def create?
      user_is_host?
    end

    def update?
      record.user == user
    end

    def show?
      record.user == user || !user_is_host?
    end

  private
  def user_is_host?
    user.role == 'host'
  end
end
