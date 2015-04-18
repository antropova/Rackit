class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :remote_ip

  private
  def current_user
    # binding.pry
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def remote_ip
    if request.remote_ip == '127.0.0.1'
      '96.224.241.215'
    else
      request.remote_ip
    end
  end
end
