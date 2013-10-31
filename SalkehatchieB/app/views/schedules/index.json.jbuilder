json.array!(@schedules) do |schedule|
  json.extract! schedule, :camp_id, :day, :event_id
  json.url schedule_url(schedule, format: :json)
end
