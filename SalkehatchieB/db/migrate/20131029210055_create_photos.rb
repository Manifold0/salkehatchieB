class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.site :references
      t.campers :references
      t.approval :boolean
      t.campers_tagged :references
      t.image :string

      t.timestamps
    end
  end
end
