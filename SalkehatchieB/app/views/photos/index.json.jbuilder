json.array!(@photos) do |photo|
  json.extract! photo, :user_id, :approval, :users_tagged, :image
  json.url photo_url(photo, format: :json)
end
