class ReviewsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @review = Review.new(review_params)
    @corral = @review.corral
    if @review.save
      update_corral_rating(@corral)
      flash[:success] = "Your review has been submitted!"
      redirect_to :back
    else
      flash[:danger] = "Can't be blank!"
      render "corrals/show"
    end
  end

  def new
    
  end

  def update
    binding.pry
  end

  def edit
    
  end

  private
  def review_params
    params.require(:review).permit(:description, :checkin_id, :rating)
  end

  def update_corral_rating(corral)
    corral.total_reviews += 1
    corral.total_rating += @review.rating
    corral.save
  end
end