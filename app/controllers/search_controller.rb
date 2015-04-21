class SearchController < ApplicationController
  def index
    @corrals = Corral.search(params[:search])
  end

  def autocomplete
    render json: Corral.location_search(params[:term])
  end
end