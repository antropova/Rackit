class AttractionsController < ApplicationController
  def index
    @spots = client.spots(current_user.current_latitude, current_user.current_longitude, types: ['restaurant', 'food', 'cafe', 'museum', 'park', 'bakery'], radius: 800)
    @corrals = 
  end
end
