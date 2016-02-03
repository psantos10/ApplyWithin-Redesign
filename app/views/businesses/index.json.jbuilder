json.array!(@businesses) do |business|
  json.extract! business, :id, :name, :business_type, :address, :postcode, :phone, :website, :about
  json.url business_url(business, format: :json)
end
