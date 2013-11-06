class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.date :year
      t.float :amount
      t.references :admin_approver
      t.date :approved_date

      t.timestamps
    end
  end
end
