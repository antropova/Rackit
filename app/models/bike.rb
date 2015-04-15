class Bike < ActiveRecord::Base
  belongs_to :user
  has_many :bike_corrals
  has_many :corrals, through: :bike_corrals
end
