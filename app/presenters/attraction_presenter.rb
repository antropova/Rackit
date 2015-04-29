class AttractionPresenter < BasePresenter
  def image_url
    if @model.photos && !@model.photos.empty?
      h.image_tag(image_request << @model.photos.first.photo_reference << image_properties, class: "img-responsive")
    else
      h.image_tag("http://placehold.it/400x300&text=No+Image+Provided", class: "img-responsive")
    end
  end

  def attraction_types
    @model.types.join(", ")
  end

  def attraction_status
    if @model.opening_hours
      @model.opening_hours["open_now"] ? h.content_tag(:p, "Open Now!", class: "text-success") : h.content_tag(:p, "Closed", class: "text-danger")
    else
      h.content_tag(:p, "No status given", class: "text-muted")
    end
  end

  def attraction_price
    if @model.price_level
      dollar_signs = ""
      (@model.price_level - 1).times do |index|
        dollar_signs << "$"
      end
    end
    h.content_tag(:p, dollar_signs, class: "text-success")
  end

  def attraction_rating
    if @model.rating
      @model.rating
    else
      h.content_tag(:p, "There is no rating on this area yet", class: "text-success")
    end
  end

  private
  def image_request
    "https://maps.googleapis.com/maps/api/place/photo?photoreference="
  end

  def image_properties
    "&sensor=false&maxheight=300&maxwidth=700&key=#{ENV['GOOGLE_API_KEY']}"
  end
end
