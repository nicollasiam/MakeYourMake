class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!

  def new
    resource = build_resource({})
    resource.build_address
    resource.build_telephone_number
    respond_with resource
  end

  protected

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end
end
