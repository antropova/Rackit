class Review < ActiveRecord::Base
  belongs_to :checkin
  delegate :corral, to: :checkin
  delegate :user, to: :checkin#, foreign_key: "user_id"

  validates_presence_of :description, :rating, on: :create
end
