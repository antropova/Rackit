class AttractionsController < ApplicationController
  # require_dependency '../presenters/application_presenter'
  # require_dependency '../presenters/attraction_presenter'
  def index
    @spots = client.spots(user_location["latitude"], user_location["longitude"], types: ['restaurant', 'food', 'cafe', 'museum', 'park', 'bakery'], radius: 800)
  end
end
