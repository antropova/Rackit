class BikeCorral < ActiveRecord::Base
  belongs_to :bike
  belongs_to :corral
  has_many :reviews
end
