class CorralsController < ApplicationController
  before_action :set_corral, only: [:show, :edit, :update, :destroy]

  # GET /corrals
  # GET /corrals.json
  def index
    @corrals = Corral.near([user_location["latitude"], user_location["longitude"]]).limit(10)
    @hash = Gmaps4rails.build_markers(@corrals) do |corral, marker|
      marker.lat(corral.latitude)
      marker.lng(corral.longitude)
    end
  end

  # GET /corrals/1
  # GET /corrals/1.json
  def show
  end

  # GET /corrals/new
  def new
    @corral = Corral.new
  end

  # GET /corrals/1/edit
  def edit
  end

  # POST /corrals
  # POST /corrals.json
  def create
    binding.pry
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

  # PATCH/PUT /corrals/1
  # PATCH/PUT /corrals/1.json
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

  # DELETE /corrals/1
  # DELETE /corrals/1.json
  def destroy
    @corral.destroy
    respond_to do |format|
      format.html { redirect_to corrals_url, notice: 'Corral was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_corral
      @corral = Corral.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def corral_params
      params.require(:corral).permit(:location, :racks, :borough_id, :latitude, :longitude)
    end
end
