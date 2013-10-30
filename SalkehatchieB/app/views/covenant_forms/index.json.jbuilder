json.array!(@covenant_forms) do |covenant_form|
  json.extract! covenant_form, :user_id, :policy, :two_adult, :training, :report_abuse, :child_abuse, :agree_to_covenant, :user_signature, :signature_date, :printed_date
  json.url covenant_form_url(covenant_form, format: :json)
end
