module UserHelper
  def get_address_in_print
    if !current_user.checked_in
      Geocoder.address([user_location["latitude"], user_location["longitude"]])
    else
      Geocoder.address([current_user.current_corral_latitude, current_user.current_corral_longitude])
    end
  end
end
