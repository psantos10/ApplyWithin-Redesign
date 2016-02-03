json.array!(@educations) do |education|
  json.extract! education, :id, :hunter_id, :institution, :qualification, :subject, :result, :start_date, :end_date
  json.url education_url(education, format: :json)
end
