require 'json'
class CoordinatesParser

	def self.parse
		self.new.call
	end

	def coordinates
		json = HTTParty.get("http://dada.pink/nyc-crime-map-data/02378420399528461352-11853667273131550346.geojson")
	end

	def parsed(json)
		result = JSON.parse(json)
	end

	def call
		result = parsed(coordinates)
		result["features"].map do |element|
			element["geometry"]["coordinates"]
		end
	end
end
		