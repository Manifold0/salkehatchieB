class CreateCamps < ActiveRecord::Migration
  def change
    create_table :camps do |t|
      t.date :start_date
      t.date :end_date
      t.string :city
      t.string :hq_address

      t.timestamps
    end
  end
end
