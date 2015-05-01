class Corral < ActiveRecord::Base
  has_many :reviews
  has_many :images
  has_many :users, through: :checkins
  belongs_to :borough
  geocoded_by :location
  after_validation :geocode, if: ->(obj) { !obj.location.present? }

  def self.search(search)
    where('location LIKE ?', "%#{search}%")
  end

  def self.location_search(search)
    search(search).limit(5).pluck(:location)
  end

  # def gmaps4rails_title
  #   "#{self.location}"
  # end
end
