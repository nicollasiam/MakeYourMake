class ImagesController < ApplicationController
  def new
    @make = Make.friendly.find(params[:make_id])
      @image = Image.new
      authorize @image

    unless @make.user == current_user
      # TODO: Redirect to 401 page (unauthorized)
      redirect_to make_path(@make)
    end
  end

  def create
    @make = Make.friendly.find(params[:make_id])

    if @make.user == current_user
      image = Image.new(image_params)
      image.make = @make
      authorize(image)

      if image.save
        redirect_to profile_user_path(@make.user)
      else
        # TODO: Stay in this view and show an error message
        redirect_to makes_path
      end
    else
      # TODO: Redirect to 401 page (unauthorized)
    end
  end


  # Private methods
  def image_params
    params.require(:image).permit(:image_url, :image_url_cache)
  end
end
