class FixMedicalFormForPhotosAndGuardian < ActiveRecord::Migration
  def change
  	add_column :medical_forms, :guardian_signature, :reference
  end
end
