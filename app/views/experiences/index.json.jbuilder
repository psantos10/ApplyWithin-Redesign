json.array!(@experiences) do |experience|
  json.extract! experience, :id, :hunter_id, :job_title, :employer, :location, :start_date, :end_date, :job_description
  json.url experience_url(experience, format: :json)
end
