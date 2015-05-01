class Checkin < ActiveRecord::Base
  belongs_to :user
  belongs_to :corral
  has_one :review
end
