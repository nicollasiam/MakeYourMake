class MakesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    if params[:busca].present?
      # Search for makes with given description
      @makes = Make.where('lower(description) LIKE ?', "%#{params[:busca].downcase}%")

      # It is possible that the user is searching for a professional
      # Search for professional if no makes were found
      if @makes.length.zero?
        @users = User.where('lower(artistic_name) LIKE ?', "%#{params[:busca].downcase}%").where(professional: :true)

        # If did not found, search for a place (district, city or state)
        if @users.length.zero?
          @addresses = Address.where('lower(state) LIKE ? OR lower(district) LIKE ? OR lower(city) LIKE ?',
                                      "%#{params[:busca].downcase}%", "%#{params[:busca].downcase}%", "%#{params[:busca].downcase}%")
        end
      end
    end

    @top_makes = Make.order(likes_count: :desc).limit(3)
    @types = policy_scope(Type).sample(9)
  end

  def show
    @all_types = Type.all.order(:name)
    @make = Make.friendly.find(params[:id])
    authorize @make
    @image = Image.new
  end
end
