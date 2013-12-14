class CreateReferenceForms < ActiveRecord::Migration
  def change
    create_table :reference_forms do |t|
      t.references :user, index: true
      t.string :name
      t.string :email
      t.string :relationship
      t.boolean :approval_status
      t.boolean :reviewed_by_camp_director
      t.date :user_approval_date

      t.timestamp :printed_date


      t.timestamps
    end
  end
end
