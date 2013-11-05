class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :user, index: true
      t.date :year
      t.float :amount
      t.string :identifier

      t.timestamps
    end
  end
end
