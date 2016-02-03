json.array!(@positions) do |position|
  json.extract! position, :id, :business_id, :title, :description, :wage, :start_date
  json.url position_url(position, format: :json)
end
