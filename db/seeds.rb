corral_borough = ""
boroughs = ["Brooklyn", "Manhattan", "Queens", "Bronx", "Staten Island"]
boroughs.each do |borough|
  Borough.create(name: borough)
end
xml_content = File.read("2013-cityracks.xml")
data = Hash.from_xml(xml_content)
data["Document"]["Placemark"].each do |element|
  Borough.pluck(:name).each do |borough|
    corral_borough = Borough.find_by_name(borough) if element["address"].include?(borough)
  end
  if !element["Point"].nil?
    coordinates = element["Point"]["coordinates"].split(",")
    Corral.create(
      location: element["address"],
      racks: element["description"].scan(/\d/)[0].to_i,
      borough_id: corral_borough.id,
      latitude: coordinates[1],
      longitude: coordinates[0])
  end
end


# results = CrimeParser.parse
# results.each do |key, value|
#   Crime.create!(
#   name: value,
#   longitude: key[0],
#   latitude:key[1]
#   )
# end
