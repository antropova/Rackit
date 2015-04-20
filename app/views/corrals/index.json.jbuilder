json.array!(@corrals) do |corral|
  json.extract! corral, :id, :location, :racks, :borough, :latitude, :longitude
  json.url corral_url(corral, format: :json)
end
