json.array!(@share_medical_requests) do |share_medical_request|
  json.extract! share_medical_request, :references, :references
  json.url share_medical_request_url(share_medical_request, format: :json)
end
