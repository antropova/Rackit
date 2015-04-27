class ReviewsController < ApplicationController
  def index
  end

  def show
  end

  def create
    corral = Corral.find(params[:corral_id])
    review = corral.reviews.create(review_params)
    flash[:success] = "Your review has been submitted!"
    redirect_to corral_url(corral)
  end

  def new
    
  end

  def edit
    
  end

  private
  def review_params
    params.require(:review).permit(:description, :user_id, :rating)
  end
end