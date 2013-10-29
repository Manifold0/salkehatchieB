class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.site :references
      t.user :references
      t.approval :boolean
	  t.users_tagged :text
      t.image :string

      t.timestamps
    end
  end
end
