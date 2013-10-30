class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :camp, index: true
      t.date :day
      t.references :event, index: true

      t.timestamps
    end
  end
end
