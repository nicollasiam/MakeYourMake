class ImagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  # There is no way to check if the make's owner which the image
  # is being added is the user. We need to chekc it in the controller
  # Will just check if user is signed in.
  def create?
    user
  end

  # There is no way to check if the make's owner which the image
  # is being added is the user. We need to chekc it in the controller
  # Will just check if user is signed in.
  def destroy?
    user
  end
end
