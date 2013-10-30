class CreateMedicalForms < ActiveRecord::Migration
  def change
    create_table :medical_forms do |t|
      t.references :user, index: true
      t.references :camp, index: true
      t.text :information
      t.string :insurance_card_image
      t.string :physician_name
      t.string :physician_number
      t.string :physician_address_1
      t.string :physician_address_2
      t.string :physician_city
      t.string :physician_state
      t.string :physician_zip
      t.string :health_insurance_company
      t.string :policy_number
      t.string :company_address
      t.string :company_number
      t.string :health_insurance_agent
      t.text :allergies
      t.text :diet_restrictions
      t.text :recent_illness_injury
      t.text :medications
      t.text :additional_conditions
      t.date :date_of_last_tetanus_shot
      t.boolean :user_approval
      t.date :user_approval_date
      t.boolean :guardian_approval
      t.date :guardian_approval_date
      t.datetime :printed_date

      t.timestamps
    end
  end
end
