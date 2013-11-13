class CreateCampAssignments < ActiveRecord::Migration
  def change
    create_table :camp_assignments do |t|
      t.references :user, index: true
      t.references :camp, index: true
      t.integer :permission_level

      t.timestamps
    end
  end
end
