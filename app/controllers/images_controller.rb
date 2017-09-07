class ImagesController < ApplicationController
  def new
    @make = Make.find(params[:make_id])
    @image = Image.new
  end

  def create
    make = Make.find(params[:make_id])
    image = Image.new(image_params)
    image.make = make
  end


  # Private methods
  def image_params
    params.require(:image).permit(:image_url, :image_url_cache)
  end
end
