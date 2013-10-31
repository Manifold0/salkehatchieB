class CreateCovenantForms < ActiveRecord::Migration
  def change
    create_table :covenant_forms do |t|
      t.references :user, index: true
      t.boolean :policy
      t.boolean :two_adult
      t.boolean :training
      t.boolean :report_abuse
      t.boolean :child_abuse
      t.boolean :agree_to_covenant
      t.string :user_signature
      t.date :signature_date
      t.datetime :printed_date

      t.timestamps
    end
  end
end
