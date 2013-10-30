json.array!(@camps) do |camp|
  json.extract! camp, :start_date, :end_date, :city, :hq_address
  json.url camp_url(camp, format: :json)
end
