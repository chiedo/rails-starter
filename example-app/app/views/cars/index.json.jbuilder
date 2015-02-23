json.array!(@cars) do |car|
  json.extract! car, :id, :name, :description, :price
  json.url car_url(car, format: :json)
end
