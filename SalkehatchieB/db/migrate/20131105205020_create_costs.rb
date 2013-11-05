class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.year :year
      t.float :amount
      t.user :admin_approver
      t.date :approved_date

      t.timestamps
    end
  end
end
