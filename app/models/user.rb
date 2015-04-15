class User < ActiveRecord::Base
  has_many :bikes
  has_many :bike_corrals, through: :bikes
  has_many :reviews, through: :bike_corrals
end
