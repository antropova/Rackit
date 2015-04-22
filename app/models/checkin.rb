class Checkin < ActiveRecord::Base
  belongs_to :user
  belongs_to :corral
end
