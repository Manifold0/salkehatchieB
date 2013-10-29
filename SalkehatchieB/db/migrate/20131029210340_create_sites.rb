class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.homeowner :string
      t.user :references
      t.photo :references

      t.timestamps
    end
  end
end
