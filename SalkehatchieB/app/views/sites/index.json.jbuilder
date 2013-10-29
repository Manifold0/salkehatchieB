json.array!(@sites) do |site|
  json.extract! site, :string, :references, :references
  json.url site_url(site, format: :json)
end
