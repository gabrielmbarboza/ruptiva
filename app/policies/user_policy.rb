class UserPolicy < ApplicationPolicy

  def index?
    user.admin?
  end

  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if @user.admin?
        scope.all
      else
        scope.where(id: @user.id)
      end
    end
  end
end
