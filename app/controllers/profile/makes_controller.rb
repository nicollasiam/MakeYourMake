class Profile::MakesController < ApplicationController
  before_action :find_make, only: [:show, :edit, :update, :destroy]

  def index
    @makes = policy_scope(Make).where(user: current_user)
  end

  def edit
    @types = Type.all
    authorize @make
  end

  def new
    @make = Make.new
    authorize @make
    @types = Type.all
    if current_user
      @user = current_user
    end
  end


  def create
    make = Make.new(make_params)
    make.likes_count = 0
    make.user = current_user

    # Cria Make_type e associar à make.
    make_type = MakeType.new
    make_type.type = Type.find(params[:make][:make_types])
    make_type.make = make
    make_type.save!

    authorize(make)
    if make.save!
      # MakeMailer.creation_confirmation(@make).deliver_now
      redirect_to profile_user_path(current_user)
    else
      render :new
    end
  end

  def update
    authorize @make
    if @make.update(make_params)
      redirect_to profile_user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @make.destroy
    authorize @make

    redirect_to profile_user_path(current_user)
  end

  # Private methods
  private

  def make_params
    params.require(:make).permit(:name, :description, :public)
  end

  def find_make
    @make = Make.friendly.find(params[:id])
  end
end
