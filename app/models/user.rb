class User < ActiveRecord::Base
  has_many :bikes
  has_many :bike_corrals, through: :bikes
  has_many :reviews, through: :bike_corrals

  def self.create_with_omniauth(auth_hash)
    create! do |user|
      binding.pry
    end
  end
end
