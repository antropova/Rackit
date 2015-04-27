class ReviewsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @user = User.find(params[:user_id])
    # @review = 
  end

  def new
    
  end

  def edit
    
  end
end
