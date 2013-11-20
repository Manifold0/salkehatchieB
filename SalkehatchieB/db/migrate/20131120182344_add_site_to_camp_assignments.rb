class AddSiteToCampAssignments < ActiveRecord::Migration
  def change
    add_column :camp_assignments, :site, :reference
  end
end
