class MakesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    if params[:search_text].present?
      # Search for makes with given description
      @makes = Make.where('lower(description) LIKE ?', "%#{params[:search_text].downcase}%")

      # It is possible that the user is searching for a professional
      # Search for professional if no makes were found
      if @makes.length.zero?
        @users = User.where('lower(artistic_name) LIKE ?', "%#{params[:search_text].downcase}%").where(professional: :true)
      end
    end

    @types = policy_scope(Type).sample(9)
  end

  def show
    @make = Make.friendly.find(params[:id])
    authorize @make
    @image = Image.new
  end
end
