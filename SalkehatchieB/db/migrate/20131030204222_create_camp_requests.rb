class CreateCampRequests < ActiveRecord::Migration
  def change
    create_table :camp_requests do |t|
      t.references :user, index: true
      t.references :camp, index: true
      t.boolean :status
      t.string :preference1
      t.string :preference2
      t.string :preference3

      t.timestamps
    end
  end
end
