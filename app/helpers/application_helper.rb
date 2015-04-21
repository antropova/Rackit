module ApplicationHelper
  def present(object, klass = nil)
    klass ||= "#{params[:controller].capitalize.singularize}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
  end
end
