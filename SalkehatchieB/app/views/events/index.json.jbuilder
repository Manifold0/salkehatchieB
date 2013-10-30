json.array!(@events) do |event|
  json.extract! event, :start_time, :end_time, :description, :address_line1, :address_line2, :email, :city, :zip, :state
  json.url event_url(event, format: :json)
end
