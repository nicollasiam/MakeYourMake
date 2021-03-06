class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!

  def new
    resource = build_resource({})
    resource.build_address
    resource.build_telephone_number
    respond_with resource
  end

  def update_resource(resource, params)
    resource.update_with_password(params)
  end

  protected

  def update_resource(resource, params)
    if resource.provider == "facebook"
      params.delete("current_password")

      resource.update_without_password(params)

    else
      resource.update_with_password(params)
    end
  end

  # The path used after sign up.

  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end
  def after_update_path_for(resource)
    profile_user_path(resource)
  end
end
