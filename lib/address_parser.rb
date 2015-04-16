require 'json'
class AddressParser

	def self.parse
		self.new.call
	end

	def addresses
		json = HTTParty.get("http://dada.pink/nyc-crime-map-data/02378420399528461352-11853667273131550346.geojson")
	end

	def parsed_info(json)
		address_result = JSON.parse(json)
	end

	def call
		binding.pry
		address_result = parsed_info(addresses)
		address_result["features"].map do |element|
			element["geometry"]["coordinates"]
		end
	end
end
