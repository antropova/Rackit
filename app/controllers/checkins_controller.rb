class CheckinsController < ApplicationController
  def create
    @checkin = current_user.checkins.build(corral_id: params[:corral_id])
    corral = Corral.find(params[:corral_id])
    if current_user.current_location != corral.location
      @checkin.save
      current_user.checkin(corral)
      flash[:success] = "You have checked in to this corral!"
      redirect_to corral_path(corral.id)
    else
      flash[:danger] = "You've already checked into this location"
      redirect_to corral_path(corral.id)
    end
  end

  def destroy

  end
end
