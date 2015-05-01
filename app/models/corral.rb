class Corral < ActiveRecord::Base
  has_many :images
  has_many :users, through: :checkins
  has_many :bikes, through: :bike_corrals
  has_many :checkins
  has_many :reviews, through: :checkins
  has_many :reviewers, -> { uniq }, through: :reviews, source: :user
  belongs_to :borough
  geocoded_by :location
  after_validation :geocode, if: ->(obj) { !obj.location.present? }

  def self.search(search)
    where('location LIKE ?', "%#{search}%")
  end

  def self.location_search(search)
    search(search).limit(5).pluck(:location)
  end

  def average_rating
    self.total_rating / self.total_reviews.to_f
  end
end
