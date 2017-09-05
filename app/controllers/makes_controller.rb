class MakesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]


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
    make = Make.new(make_params)

    if make.save!
      # params['make']['images_attributes'].first[1]['image_url']
      # Descobrir como pegar a url remota
      # provavelmente: params['make']['images_attributes'].first[1]['image_url'].split('/').last
      image = Image.new(image_url: params['make']['images_attributes'].first[1]['image_url'].split('/').last)
      image.make = make
      image.save!

      redirect_to makes_path
    else
      render :new
    end



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
