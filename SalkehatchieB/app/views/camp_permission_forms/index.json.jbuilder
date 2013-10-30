json.array!(@camp_permission_forms) do |camp_permission_form|
  json.extract! camp_permission_form, :user_id, :type, :relationship, :name, :address1, :address2, :city, :state, :zip, :business, :work_phone_number, :phone_number, :signature_of_guardian, :approval, :camp, :printed_date
  json.url camp_permission_form_url(camp_permission_form, format: :json)
end
