json.array!(@camp_assignments) do |camp_assignment|
  json.extract! camp_assignment, :user_id, :camp_id, :permission_level
  json.url camp_assignment_url(camp_assignment, format: :json)
end
