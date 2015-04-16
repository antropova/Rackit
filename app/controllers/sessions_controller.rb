class SessionsController < ApplicationController
  def new
  end

  def create
    binding.pry
  end

  def destroy
    session[:user_id] = nil
    flash[:danger] = "Signed Out!"
    redirect_to root_url
  end

  private
  def auth_hash
    request.env["omniauth.auth"]
  end
end
