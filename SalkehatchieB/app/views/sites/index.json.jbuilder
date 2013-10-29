json.array!(@sites) do |site|
  json.extract! site, :homeowner
  json.url site_url(site, format: :json)
end
