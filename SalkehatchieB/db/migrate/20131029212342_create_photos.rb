class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :user, index: true
      t.references :site
      t.boolean :approval
      t.text :users_tagged
      t.string :image

      t.timestamps
    end
  end
end
