class MakesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    @makes = Make.all
  end

  def show
    @make = Make.find(params[:id])
  end
end
