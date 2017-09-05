class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # Aditional parameters for user
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :artistic_name, :telephone_number, :address, :professional])
  end
end
