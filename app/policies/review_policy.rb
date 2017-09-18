class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true
  end

  def destroy?
    is_user_or_admin?
  end


  # Private methods
  private

  def is_user_or_admin?
    record.user == user || user.admin == true
  end
end
