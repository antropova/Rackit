class CorralsController < ApplicationController
  before_action :set_corral, only: [:show, :edit, :update, :destroy]
  before_action :change_corral, only: [:create, :edit, :update, :destroy]
  
  def index
    @corrals = Corral.near([current_user.current_latitude, current_user.current_longitude]).limit(10)
    @hash = Gmaps4rails.build_markers(@corrals) do |corral, marker|
      marker.lat(corral.latitude)
      marker.lng(corral.longitude)
      marker.infowindow(corral.location)
    end
  end

  def show
    @users = User.where(current_location: @corral.location)
    @reviews = set_corral.reviews.page(params[:page]).per_page(5)
    # @review = Review.find(params[:id])
    @review = Review.new
  end

  def new
    @corral = Corral.new
  end

  def edit
  end

  def create
    @corral = Corral.new(corral_params)
    respond_to do |format|
      if @corral.save
        format.html { redirect_to @corral, notice: 'Corral was successfully created.' }
        format.json { render :show, status: :created, location: @corral }
      else
        format.html { render :new }
        format.json { render json: @corral.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @corral.update(corral_params)
        format.html { redirect_to @corral, notice: 'Corral was successfully updated.' }
        format.json { render :show, status: :ok, location: @corral }
      else
        format.html { render :edit }
        format.json { render json: @corral.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @corral.destroy
    respond_to do |format|
      format.html { redirect_to corrals_url, notice: 'Corral was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_corral
      @corral = Corral.find(params[:id])
    end

    def change_corral
      if !current_user.admin?
        flash[:danger] = "Sorry, you cant #{params[:action]} this corral. Click this message to close it"
        redirect_to set_corral
      end
    end

    def corral_params
      params.require(:corral).permit(:location, :racks, :borough_id, :latitude, :longitude)
    end
end
