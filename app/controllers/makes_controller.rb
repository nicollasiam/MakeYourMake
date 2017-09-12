class MakesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    if params[:search_text].present?
      # Search for makes with given description
      @makes = Make.where('description LIKE ?', "%#{params[:search_text]}%")

      # It is possible that the user is searching for a professional
      # Search for professional if no makes were found
      if @makes.length.zero?
        @users = User.where('artistic_name LIKE ?', "%#{params[:search_text]}%").where(professional: :true)
      end
    end

    @types = policy_scope(Type).sample(9)
  end

  def show
    @make = Make.find(params[:id])
    authorize @make
    @image = Image.new
  end
end
