class RackitParser
  def self.parse
    self.new.call
  end

  def build_boroughs(array)
    array.each do |element|
      Borough.create(name: element)
    end
  end

  def build_corrals(element)
    corral_borough = ""
    Borough.pluck(:name).each do |borough|
      corral_borough = Borough.find_by_name(borough) if element["address"].include?(borough)
    end
    coordinates = element["Point"]["coordinates"].split(",")
    Corral.create(
      location: element["address"],
      racks: element["description"].scan(/\d/)[0].to_i,
      borough_id: corral_borough.id,
      longitude: coordinates[0].to_f,
      latitude: coordinates[1].to_f
    )
  end

  def call
    build_boroughs(boroughs)
    corral_file["Document"]["Placemark"].each do |element|
      build_corrals(element)
    end
  end

  private
  def corral_file
    xml_content = File.read("./2013-cityracks.xml")
    Hash.from_xml(xml_content)
  end

  def boroughs
    ["Brooklyn", "Manhattan", "Queens", "Bronx", "Staten Island"]
  end
end
