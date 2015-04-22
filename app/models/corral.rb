class Corral < ActiveRecord::Base
  has_many :bike_corrals
  has_many :bikes, through: :bike_corrals
  has_many :checkins
  has_many :users, through: :checkins
  belongs_to :borough
  geocoded_by :location
  after_validation :geocode, if: ->(obj) { obj.location.present? }

  def self.search(search)
    where('location LIKE ?', "%#{search}%")
  end

  def self.location_search(search)
    search(search).limit(5).pluck(:location)
  end
end