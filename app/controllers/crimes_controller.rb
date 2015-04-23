class CrimesController < ApplicationController

	def index
    @crimes = Crime.near([user_location["latitude"], user_location["longitude"]]).limit(10)
    @hash = Gmaps4rails.build_markers(@crimes) do |crime, marker|
      marker.lat(crime.latitude)
      marker.lng(crime.longitude)
      marker.infowindow(crime.description)
    end
  end

  def show
    @user = User.find(current_user.id)
  end

  private
    def crime_params
      params.require(:crime).permit(:location, :borough_id, :latitude, :longitude)
    end
end