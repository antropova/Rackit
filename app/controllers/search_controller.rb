class SearchController < ApplicationController
  def index
    @corrals = Corral.search(params[:search])
    if @corrals.size == 1 
      redirect_to corral_path(@corrals.first)
    end
  end

  def autocomplete
    render json: Corral.location_search(params[:term])
  end
end