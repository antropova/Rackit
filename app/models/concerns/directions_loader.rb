require 'httparty'
class DirectionsLoader
  attr_reader :base_url

  def initialize(api_key = nil)
    @api_key = api_key || ENV["GOOGLE_API_KEY"]
    @base_url = "https://maps.googleapis.com/maps/api/directions/json?"
  end

  def get_directions(latitude, longitude, destination)
    HTTParty.get(base_url << "origin=#{latitude},#{longitude}" << "&destination=#{destination}&avoid=highways&mode=bicycling&key=#{@api_key}")
  end

  def get_directions_based_on_address(address, destination)
    HTTParty.get(base_url << "origin=#{address}" << "&destination=#{destination}&avoid=highways&mode=bicycling&key=#{@api_key}")
  end

end
