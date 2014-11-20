json.array!(@users) do |user|
  json.extract! user, :id, :latitude, :longitude, :title, :address, :parish, :postcode, :description, :category, :picture
  json.url user_url(user, format: :json)
end
