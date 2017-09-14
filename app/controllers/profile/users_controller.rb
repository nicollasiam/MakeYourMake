class Profile::UsersController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :show
  skip_after_action :verify_authorized, :only => :show
  skip_after_action :verify_policy_scoped, :only => :show
  def show
    @user = User.find(params[:id])
    @makes = Make.where(["user_id = ?", @user.id])
    @banner_makes = @makes.select do |make|
      make.images.first.present?
    end
  end
end