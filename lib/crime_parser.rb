require 'json'
require 'pry'
require 'httparty'
class CrimeParser

	def self.parse
		self.new.call
	end

	def crimes
		json = HTTParty.get("http://dada.pink/nyc-crime-map-data/02378420399528461352-17772055697785505571.geojson")
	end

	def parsed_info(json)
		crime_result = JSON.parse(json)
	end

	def call
		crime_result = parsed_info(addresses)
		results = crime_result["features"].map do |element|
			[element["geometry"]["coordinates"], element["properties"]["CR"]]
		end
		results
	end
end
CrimeParser.parse
