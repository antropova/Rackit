module ApplicationHelper
  def present(object, klass = nil)
    klass ||= "#{params[:controller].capitalize.singularize}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
  end

  def location_data
    data = session.to_hash["location"]
    content_tag(:strong, "#{data["zip_code"]}, #{data["latitude"]}, #{data["longitude"]}")
  end
end
