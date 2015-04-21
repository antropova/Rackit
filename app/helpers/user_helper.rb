module UserHelper
  def get_address_in_print
    Geocoder.address([user_location["latitude"], user_location["longitude"]])
  end
end
