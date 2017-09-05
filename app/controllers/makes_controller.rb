class MakesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    @makes = Make.all
  end

  def show
    @make = Make.find(params[:id])
  end

  def edit
    @make = Make.find(params[:id])
  end

  def new
    @make = Make.new
  end

  def create
    make = Make.new(make_params)
    make.likes_count = 0
    make.user = current_user

    if make.save!
      redirect_to makes_path
    else
      render :new
    end
  end

  def update
    make = Make.find(params[:id])

    if make.update(make_params)
      redirect_to make_path
    else
      render :edit
    end
  end

  def destroy
  end

  # Private methods
  private

  def make_params
    params.require(:make).permit(:name, :description, :likes_count, :public)
  end
end
