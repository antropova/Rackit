class UsersController < ApplicationController
	
	def index
  	@users = User.all
  end

  def show
  end

  def edit
  end

  def new
  end

  def create
  	 @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = 'Your profile was created successfully!'
        format.html { redirect_to home_url }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  	 respond_to do |format|
      # binding.pry
      if @user.update(user_params)
        flash[:success] = "Your profile was successfully updated. "
        format.html { redirect_to @user}
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_params
    params.require(:user).permit(:id, :name, :bio, :email, :location, :image_url, :provider, :uid)
  end
end
