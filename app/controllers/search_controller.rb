class SearchController < ApplicationController
  def index
    @corrals = Corral.search(params[:search])
  end
end
