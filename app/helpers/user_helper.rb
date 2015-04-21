module UserHelper
  def get_address_in_print
    Geocoder.search(location_data).first.data["GeoObject"]["metaDataProperty"]["GeocoderMetaData"]["text"]
  end
end
