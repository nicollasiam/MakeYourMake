class MakePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # Everyone can access show
  # The front end must hide/show buttons if user is or is not the make's owner
  def show?
    true
  end

  # Only professionals and admins can create makes
  def create?
    user_is_professional_or_admin?
  end

  # Only the owner or admins can edit makes
  def update?
    user_is_owner_or_admin?
  end

  # Only the owner or admins can delete makes
  def destroy?
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
