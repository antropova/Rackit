class CorralsController < ApplicationController
  def index
    @corrals = Corral.all
    @hash = Gmaps4rails.build_markers(@corrals) do |corral, marker|
      marker.lat corral.latitude
      marker.lng corral.longitude
    end
  end
end
