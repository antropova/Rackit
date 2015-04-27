module UserHelper
  def get_address_in_print
    Geocoder.address([current_user.current_latitude, current_user.current_longitude])
  end
end
