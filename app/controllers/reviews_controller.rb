class ReviewsController < ApplicationController

  def create
    puts "aloha"
    @make = Make.find(params[:make_id])
    puts @make
    review = Review.new(review_params)
    review.make = @make
    review.user = current_user
    puts review

    authorize(review)

    review.save
  end

  def destroy
    make = Make.find(params[:id])
    review = nil
    authorize(review)
    review.destroy
  end

  private

  def review_params
  params.require(:review).permit(:content, :make_id)
  end

end
