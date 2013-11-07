class CreateCampRequests < ActiveRecord::Migration
  def change
    create_table :camp_requests do |t|
      t.references :user, index: true
      #Camp doesn't matter. If it does you can pull it through the user
      #t.references :camp, index: true
      t.boolean :status
      t.integer :preference1_id
      t.integer :preference2_id
      t.integer :preference3_id

      t.timestamps
    end
  end
end
