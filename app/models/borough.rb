class Borough < ActiveRecord::Base
  has_many :corrals
  has_many :crimes
end
