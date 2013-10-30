json.array!(@medical_forms) do |medical_form|
  json.extract! medical_form, :user_id, :camp_id, :information, :insurance_card_image, :physician_name, :physician_number, :physician_address_1, :physician_address_2, :physician_city, :physician_state, :physician_zip, :health_insurance_company, :policy_number, :company_address, :company_number, :health_insurance_agent, :allergies, :diet_restrictions, :recent_illness_injury, :medications, :additional_conditions, :date_of_last_tetanus_shot, :user_approval, :user_approval_date, :guardian_approval, :guardian_approval_date, :printed_date
  json.url medical_form_url(medical_form, format: :json)
end
