class AddGuardianPrintedToMedicalForm < ActiveRecord::Migration
  def change
  	add_column :medical_forms, :guardian_printed, :string
  end
end
