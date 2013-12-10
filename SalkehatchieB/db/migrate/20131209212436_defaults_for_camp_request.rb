class DefaultsForCampRequest < ActiveRecord::Migration
  def self.up
  	change_column_default :camp_requests, :status, false
  end
  def self.down
  	raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end