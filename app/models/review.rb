class Review < ActiveRecord::Base
  belongs_to :corral
  belongs_to :user
  validates_presence_of :description, :rating, on: :create, message: "cant be blank"
end
