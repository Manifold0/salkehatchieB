class ChangeDateToDatetimeInReferenceForm < ActiveRecord::Migration
  def self.up
   change_column :reference_forms, :user_approval_date, :datetime
  end

  def self.down
   change_column :reference_forms, :user_approval_date, :date
  end
end
