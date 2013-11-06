json.array!(@payments) do |payment|
  json.extract! payment, :user_id, :year, :amount, :identifier
  json.url payment_url(payment, format: :json)
end
