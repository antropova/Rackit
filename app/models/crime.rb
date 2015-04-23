class Crime < ActiveRecord::Base
	belongs_to :borough
	geocoded_by :location
	after_validation :geocode, if: ->(obj) { obj.location.present? }
end
