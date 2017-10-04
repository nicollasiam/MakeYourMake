class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # Only professionals and admins can create conversations and see the conversations

  def create?
    user_is_owner_or_admin?
  end

  # Only the owner or admins can delete conversations
  def destroy?
    user_is_owner_or_admin?
  end

  # Private methods
  private

  def user_is_owner_or_admin?
    record.sender == user || user.admin
  end

  def user_is_professional_or_admin?
    user.professional || user.admin
  end
end
