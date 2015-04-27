class CrimesController < ApplicationController

	def index
		@crimes = Crime.near([user_location["latitude"], user_location["longitude"]]).limit(20)
    @hash = Gmaps4rails.build_markers(@crimes) do |crime, marker|
      marker.lat(crime.latitude)
      marker.lng(crime.longitude)
    end
  end

  def show
    @user = User.find(current_user.id)
  end

  def new
  	@crime = Crime.new
  end

  private
    def crime_params
      # params.require(:crime).permit(:latitude, :longitude)
    end
end