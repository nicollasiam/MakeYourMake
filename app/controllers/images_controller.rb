class ImagesController < ApplicationController
  def new
    @make = Make.find(params[:make_id])

    if @make.user == current_user
      @image = Image.new
      authorize @image
    else
      # TODO: Redirect to 401 page (unauthorized)
    end
  end

  def create
    # raise
    make = Make.find(params[:make_id])

    if make.user == current_user
      image = Image.new(image_params)
      image.make = make
      authorize(image)

      image.save!
    else
      # TODO: Redirect to 401 page (unauthorized)
    end
  end


  # Private methods
  def image_params
    params.require(:image).permit(:image_url, :image_url_cache)
  end
end
