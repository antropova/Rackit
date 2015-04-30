class ReviewsController < ApplicationController
  def index
  end

  def show
  end

  def create
    # binding.pry
    @review = Review.new(review_params)
    @corral = @review.corral
    if @review.save
      flash[:success] = "Your review has been submitted!"
      redirect_to :back
    else
      flash[:danger] = "Can't be blank!"
      render "corrals/show"
    end
  end

  def new
    
  end

  def edit
    
  end

  private
  def review_params
    params.require(:review).permit(:description, :checkin_id, :rating)
  end
end