class CreateShareMedicalRequests < ActiveRecord::Migration
  def change
    create_table :share_medical_requests do |t|
      t.camper :references
      t.medical_form :references

      t.timestamps
    end
  end
end
