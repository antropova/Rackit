class SessionsController < ApplicationController
  def create
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
    if user
      session[:user_id] = user.id
      user.update!(user_location_params)
      flash[:success] = "Welcome back, #{user.name}!"
      redirect_to root_url
    else
      @user = User.create_with_omniauth(auth)
      render '/users/new'
    end
  end

  def destroy
    current_user.update!(current_location: "", current_latitude: 0.0, current_longitude: 0.0, current_sign_in_ip: "")
    session.destroy
    flash[:danger] = "Signed Out!"
    redirect_to root_url
  end

  private
  def auth
    request.env["omniauth.auth"]
  end
end
