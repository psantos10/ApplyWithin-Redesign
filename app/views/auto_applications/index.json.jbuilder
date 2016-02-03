json.array!(@auto_applications) do |auto_application|
  json.extract! auto_application, :id
  json.url auto_application_url(auto_application, format: :json)
end
