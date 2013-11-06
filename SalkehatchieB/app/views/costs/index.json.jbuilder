json.array!(@costs) do |cost|
  json.extract! cost, :year, :amount, :admin_approver, :approved_date
  json.url cost_url(cost, format: :json)
end
