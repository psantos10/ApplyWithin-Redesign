json.array!(@hunters) do |hunter|
  json.extract! hunter, :id, :first_name, :last_name, :dob, :nationality, :location, :phone
  json.url hunter_url(hunter, format: :json)
end
