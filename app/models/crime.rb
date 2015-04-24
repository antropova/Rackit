class Crime < ActiveRecord::Base
	geocoded_by :location
  after_validation :geocode, if: ->(obj) { !obj.location.present? }
	belongs_to :borough
end
