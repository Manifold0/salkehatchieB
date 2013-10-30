json.array!(@camp_requests) do |camp_request|
  json.extract! camp_request, :user_id, :camp_id, :status, :preference1, :preference2, :preference3
  json.url camp_request_url(camp_request, format: :json)
end
