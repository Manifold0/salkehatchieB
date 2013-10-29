json.array!(@photos) do |photo|
  json.extract! photo, :references, :references, :boolean, :references, :string
  json.url photo_url(photo, format: :json)
end
