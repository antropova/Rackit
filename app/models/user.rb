class User < ActiveRecord::Base
  has_many :bikes
  has_many :bike_corrals, through: :bikes
  has_many :reviews, through: :bike_corrals
  geocoded_by :ip_address, latitude: :latitude, longitude: :longitude
  after_validation :geocode


  def self.create_with_omniauth(auth)
    new do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
      user.email = auth["info"]["email"]
      user.location = auth["info"]["location"]
      user.image_url = auth["info"]["image"]
    end
  end
end
