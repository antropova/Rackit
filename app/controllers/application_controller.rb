class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :set_user_location, :user_location, :remote_ip, :client

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # binding.pry
  end

  def set_user_location
    Geocoder.search(remote_ip).first.data
  end

  def user_location
    session.to_hash["location"]
  end

  def remote_ip
    request.remote_ip == '127.0.0.1' ? '96.224.241.215' : request.remote_ip
  end

  def client
    GooglePlaces::Client.new(ENV['GOOGLE_PLACES_KEY'])
  end
end
