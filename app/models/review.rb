class Review < ActiveRecord::Base
  belongs_to :corral
  belongs_to :user
end
