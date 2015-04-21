class SessionsController < ApplicationController
  def create
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
    if user
<<<<<<< HEAD
=======
      # binding.pry
>>>>>>> th
      session[:user_id], session[:location] = user.id, Geocoder.search(remote_ip).first.data
      flash[:success] = "Welcome back, #{user.name}!"
      redirect_to root_url
    else
      @user = User.create_with_omniauth(auth)
      render '/users/new'
    end
  end

  def destroy
    session.destroy
    flash[:danger] = "Signed Out!"
    redirect_to root_url
  end

  private
  def auth
    request.env["omniauth.auth"]
  end
end
