class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
    if user
      session[:user_id] = user.id
      flash[:success] = "Welcome back, #{user.name}!"
      redirect_to root_url
    else
      @user = User.create_with_omniauth(auth)
      render '/users/new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:danger] = "Signed Out!"
    redirect_to root_url
  end

  private
  def auth
    request.env["omniauth.auth"]
  end
end
