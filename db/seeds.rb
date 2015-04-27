<<<<<<< HEAD
require 'httparty'
require 'Geocoder'
require 'json'
# corral_borough = ""
# boroughs = ["Brooklyn", "Manhattan", "Queens", "Bronx", "Staten Island"]
# boroughs.each do |borough|
#   Borough.create(name: borough)
# end
# xml_content = File.read("2013-cityracks.xml")
# data = Hash.from_xml(xml_content)
# data["Document"]["Placemark"].each do |element|
#   Borough.pluck(:name).each do |borough|
#     corral_borough = Borough.find_by_name(borough) if element["address"].include?(borough)
#   end
#   if !element["Point"].nil?
#     coordinates = element["Point"]["coordinates"].split(",")
#     Corral.create(
#       location: element["address"],
#       racks: element["description"].scan(/\d/)[0].to_i,
#       borough_id: corral_borough.id,
#       latitude: coordinates[1],
#       longitude: coordinates[0])
#   end
# end


crimes = JSON.parse(HTTParty.get("http://dada.pink/nyc-crime-map-data/02378420399528461352-17772055697785505571.geojson"))

crimes["features"].map {|element| element["geometry"]["coordinates"]}.each do |coordinates|
  Corral.near([coordinates[1], coordinates[0]], 3, units: :km, order: :distance).update_all("crimes = crimes + 1")
end
