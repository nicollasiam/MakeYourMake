class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end
  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def configure_permitted_parameters
    # Aditional parameters for user
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :first_name, :last_name, :artistic_name, :professional, :description,
                                      address_attributes: [:street, :number, :user_id, :complement, :zip_code, :city, :district, :state, :public],
                                      telephone_number_attributes: [:ddd, :number]])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :first_name, :last_name, :artistic_name, :professional, :id, :description,
                                      address_attributes: [:street, :number, :id, :complement, :zip_code, :city, :district, :state, :public],
                                      telephone_number_attributes: [:id, :ddd, :number]])
  end

end



