class CheckinsController < ApplicationController
  def create
    @checkin = current_user.checkins.build(corral_id: params[:corral_id])
    corral = Corral.find(params[:corral_id])
    if !current_user.checked_in
      binding.pry
      @checkin.save
      current_user.update(checked_in: true)
      corral.take_rack
      flash[:success] = "You have checked in to this corral!"
      redirect_to corral_path(corral.id)
    else
      flash[:danger] = "You could not checkin to this corral"
    end
  end

  def destroy

  end
end
