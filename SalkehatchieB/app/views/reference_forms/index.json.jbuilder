json.array!(@reference_forms) do |reference_form|
  json.extract! reference_form, :user_id, :name, :email, :relationship, :approval_status, :reviewed_by_camp_director, :printed_date
  json.url reference_form_url(reference_form, format: :json)
end
