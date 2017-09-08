class MakesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    # @feautured_makes = policy_scope(Make).order(likes_count: :desc).limit(9)
    @types = policy_scope(Type).sample(9)
  end

  def show
    @make = Make.find(params[:id])
    authorize @make
    @image = Image.new
  end
end
