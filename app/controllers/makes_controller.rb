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
    raise
  end

  def update
  end

  def destroy
  end

  # Private methods
  private

  def make_params
    params.require(:make).permit(:name, :description, :likes_count, :public, images_attributes: [:id, :image_url, :image_url_cache, :_destroy])
  end
end
