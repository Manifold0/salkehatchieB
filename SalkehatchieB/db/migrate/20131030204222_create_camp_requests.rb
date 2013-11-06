class CreateCampRequests < ActiveRecord::Migration
  def change
    create_table :camp_requests do |t|
      t.references :user, index: true
      #Camp doesn't matter. If it does you can pull it through the user
      #t.references :camp, index: true
      t.boolean :status
      t.references :preference1
      t.references :preference2
      t.references :preference3

      t.timestamps
    end
  end
end
