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
    @image = Image.new
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
  end

  def destroy
  end

  # Private methods
  private

  def make_params
    params.require(:make).permit(:name, :description, :likes_count, :public,
    images_attributes: [:id, :image_url, :image_url_cache, :_destroy])
  end
end
