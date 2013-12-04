class CreateCampPermissionForms < ActiveRecord::Migration
  def change
    create_table :camp_permission_forms do |t|
      t.references :user, index: true
      t.string :type_of
      t.string :relationship
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :business
      t.string :work_phone_number
      t.string :phone_number
      t.string :signature_of_guardian
      t.boolean :approval
      t.string :camp
      t.datetime :printed_date

      t.timestamps
    end
  end
end
