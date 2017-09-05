class MakesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    @makes = policy_scope(Make)
  end

  def show
    @make = Make.find(params[:id])
  end
end
