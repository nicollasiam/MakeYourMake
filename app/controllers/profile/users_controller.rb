class Profile::UsersController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :show
  skip_after_action :verify_authorized, :only => :show
  skip_after_action :verify_policy_scoped, :only => :show

  def show
    @user = User.friendly.find(params[:id])
    # Redirect to index if user is not a professional
    redirect_to root_path unless @user.professional

    @makes = Make.where(user: @user)
    # Check if makes are filtered
    # Find only the makes that are not public
    if params[:nao_publico].present? && params[:nao_publico] == 'true'
      @makes = @makes.where(public: false)
    end

    # Find only the makes that has no images
    if params[:sem_foto].present? && params[:sem_foto] == 'true'
      @makes = @makes.includes(:images).where(images: { make_id: nil })
    end

    @banner_makes = @makes.select do |make|
      raise
      make.images.first.present?
    end
    @review = Review.new

    if params[:nao_publico].present? || params[:sem_foto].present?
      respond_to { |format| format.js }
    end
  end

  def index
    @telephone_numbers = Telephone_numbers.all
    @ddd = Ddd.all
    @number = Number.all
  end
end
