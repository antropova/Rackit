class ReviewsController < ApplicationController
  def index
  end

  def show
  end

  def create
    corral = Corral.find(params[:corral_id])
    review = corral.reviews.build(review_params)
    if review.save
      flash[:success] = "Your review has been submitted!"
    else
      flash[:danger] = "Can't be blank!"
    end
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