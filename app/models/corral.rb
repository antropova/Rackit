class Corral < ActiveRecord::Base
  has_many :bike_corrals
  has_many :bikes, through: :bike_corrals
  belongs_to :borough
end
