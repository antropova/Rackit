module CorralsHelper
  def location_data
    data = session.to_hash["location"]
    content_tag(:strong, "#{data["zip_code"]}, #{data["latitude"]}, #{data["longitude"]}")
  end

  def rack_colors(corral)
    if corral.racks <= 1
      content_tag(:td, corral.racks, class: "text-danger")
    else
      content_tag(:td, corral.racks, class: "text-success")
    end
  end
end
