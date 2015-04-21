class AttractionPresenter < BasePresenter
  def image_url
    if @model.photos && !@model.photos.empty?
      h.image_tag(image_request << @model.photos.first.photo_reference << image_properties, class: "img-responsive")
    else
      h.image_tag("http://placehold.it/400x300&text=No+Image+Provided", class: "img-responsive")
    end
  end

  def attraction_types
    content_tag(:strong, @model.types.join(", "))
  end

  def attraction_status
    if @model.opening_hours["open_now"]
      content_tag(:strong, "Open Now!", class: "text-success")
    else
      content_tag(:strong, "Closed", class: "text-danger")
    end
  end

  # def attraction_price
  #   content_tag(:strong, class: "text-success") do
  #     @model.price_level.times do |index|
  #       "$"
  #     end
  #   end
  # end


  private
  def image_request
    "https://maps.googleapis.com/maps/api/place/photo?photoreference="
  end

  def image_properties
    "&sensor=false&maxheight=300&maxwidth=700&key=#{ENV['GOOGLE_PLACES_KEY']}"
  end
end
