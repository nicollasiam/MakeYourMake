class Profile::LikedMakesController < ApplicationController
  def index
    @liked_makes = policy_scope(LikedMake).where(user: current_user)
  end

  def create
    make = Make.find(params[:make_id])
    puts "params: #{params}"

    liked_make = LikedMake.new
    liked_make.make = make
    liked_make.user = current_user
    authorize(liked_make)

    liked_make.save
  end

  def destroy
    liked_make = LikedMake.find(params[:id])
    liked_make.destroy
  end
end
