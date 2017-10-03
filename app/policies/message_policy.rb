class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # Only professionals and admins can create and see messages
  def index?
    user.admin?
  end

  def create?
    user_is_owner_or_admin?
  end

  # Private methods
  private

  def user_is_owner_or_admin?
    record.user == user || user.admin
  end

  def user_is_professional_or_admin?
    user.professional || user.admin
  end
end
