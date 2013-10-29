class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.homeowner :string

      t.timestamps
    end
  end
end
