class AttractionsController < ApplicationController
  def index
    @spots = client.spots(current_user.current_latitude, current_user.current_longitude, types: ['restaurant', 'food', 'cafe', 'museum', 'park', 'bakery'], radius: 800)
  end

  def directions
    loader = DirectionsLoader.new
    directions = loader.get_directions_based_on_address(current_user.current_location, params[:vicinity])
    @directions = directions["routes"][0]["legs"][0]["steps"]
    binding.pry
  end
end
