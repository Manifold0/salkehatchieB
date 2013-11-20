class AddCreatedByToCosts < ActiveRecord::Migration
  def change
    add_column :costs, :created_by_id, :reference
  end
end
