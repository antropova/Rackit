module UserHelper
  def get_address_in_prints
    Geocoder.address([current_user.current_latitude, current_user.current_longitude])
  end
end
