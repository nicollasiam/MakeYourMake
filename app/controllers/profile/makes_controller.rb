class Profile::MakesController < ApplicationController
  before_action :find_make, only: [:show, :edit, :update, :destroy]

  def index
    @makes = Make.all.where(user: current_user)
  end

  def show
  end

  def edit
  end

  def new
    @make = Make.new
  end

  def create
    make = Make.new(make_params)
    make.likes_count = 0
    make.user = current_user

    if make.save!
      MakeMailer.creation_confirmation(@make).deliver_now
      redirect_to make_path
    else
      render :new
    end
  end

  def update
    if @make.update(make_params)
      redirect_to make_path(@make)
    else
      render :edit
    end
  end

  def destroy
    @make.destroy

    redirect_to profile_makes_path
  end

  # Private methods
  private

  def make_params
    params.require(:make).permit(:name, :description, :likes_count, :public)
  end

  def find_make
    @make = Make.find(params[:id])
  end
end
