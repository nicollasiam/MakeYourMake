class Profile::LikedMakesController < ApplicationController
  def index
    @liked_makes = policy_scope(LikedMake).where(user: current_user)
    @makes = []
    @liked_makes.each do |liked_make|
      @makes << liked_make.make
    end
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
    make = Make.find(params[:id])
    liked_make = nil

    make.liked_makes.each do |liked|
      if liked.user == current_user
        liked_make = liked
        break
      end
    end

    authorize(liked_make)
    liked_make.destroy
  end
end
