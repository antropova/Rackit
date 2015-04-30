class User < ActiveRecord::Base
  has_many :bikes
  has_many :checkins
  has_many :corrals, through: :checkins
  # has_many :bike_corrals, through: :bikes
  has_many :reviews, through: :checkins

  has_many :checkins_with_reviews, through: :reviews, :source => :checkin
  has_many :reviewed_corrals, -> { uniq }, through: :checkins_with_reviews, :source => :corral

  validates_presence_of :email, :name, on: :create, message: "can't be blank"
  validates_uniqueness_of :email, on: :create, message: " is already taken"
  after_create :sign_up_user

  def self.create_with_omniauth(auth)
    new do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
      user.email = auth["info"]["email"]
      user.location = auth["info"]["location"]
      user.image_url = auth["info"]["image"]
    end
  end

  def checkin(corral)
    update!(current_location: corral.location, current_latitude: corral.latitude,current_longitude: corral.longitude)
    corral.update!(racks: corral.racks -= 1) if corral.racks >= 1
    self.update!(checked_in: true)
  end

  def checkout(corral)
    corral.update!(racks: corral.racks += 1)
    self.update!(checked_in: false)
  end

  def fetch_latest_checkin(corral)
    Checkin.where(:corral_id => corral.id, :user_id => self.id).last
  end

  private
  def sign_up_user
    UserMailer.registration_confirmation(self).deliver_now
  end
end
