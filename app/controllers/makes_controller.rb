class MakesController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
    @make = Make.new
    @image = Image.new
  end

  def create
  end

  def update
  end

  def destroy
  end

  # Private methods
  private

  def make_params
    params.require(:make).permit(:name, :description, :likes_count, :public)
  end
end
