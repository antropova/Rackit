class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
    if user
      session[:user_id] = user.id
      binding.pry
      user.update(ip_address: remote_ip)
      flash[:success] = "Welcome back, #{user.name}!"
      redirect_to root_url
    else
      @user = User.create_with_omniauth(auth)
      render '/users/new'
    end
  end

  def destroy
    binding.pry
    current_user.update(ip_address: nil, longitude: nil, latitude: nil)
    session[:user_id] = nil
    flash[:danger] = "Signed Out!"
    redirect_to root_url
  end

  private
  def auth
    request.env["omniauth.auth"]
  end
end
