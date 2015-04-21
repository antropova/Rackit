module CorralsHelper
  def rack_colors(corral)
    if corral.racks <= 1
      content_tag(:td, corral.racks, class: "text-danger")
    else
      content_tag(:td, corral.racks, class: "text-success")
    end
  end
end
