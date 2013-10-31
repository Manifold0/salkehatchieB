class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.text :description
      t.string :address_line1
      t.string :address_line2
      t.string :email
      t.string :city
      t.string :zip
      t.string :state

      t.timestamps
    end
  end
end
