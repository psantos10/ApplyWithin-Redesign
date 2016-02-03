json.array!(@languages) do |language|
  json.extract! language, :id, :hunter_id, :name, :spoken_level, :written_level, :reading_level
  json.url language_url(language, format: :json)
end
