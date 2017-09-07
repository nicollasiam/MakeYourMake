class ImagesController < ApplicationController
  def new
    if make.user == current_user
      @make = Make.find(params[:make_id])
      @image = Image.new
      authorize @image
    else
      # TODO: Redirect to 401 page (unauthorized)
    end
  end

  def create
    if make.user == current_user
      make = Make.find(params[:make_id])
      image = Image.new(image_params)
      image.make = make
    else
      # TODO: Redirect to 401 page (unauthorized)
    end
  end


  # Private methods
  def image_params
    params.require(:image).permit(:image_url, :image_url_cache)
  end
end
