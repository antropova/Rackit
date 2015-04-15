class Review < ActiveRecord::Base
  belongs_to :bike_corral
  delegate :user, to: :bike_corral
  delegate :corral, to: :bike_corral
end
