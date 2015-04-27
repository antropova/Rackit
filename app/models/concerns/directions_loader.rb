require 'httparty'
class DirectionsLoader
  attr_reader :base_url

  def initalize(api_key = nil)
    @api_key = api_key || ENV["GOOGLE_API_KEY"]
    @base_url = "https://maps.googleapis.com/maps/api/directions/json?"
  end

  def get_directions(origin, destination)

  end


end
