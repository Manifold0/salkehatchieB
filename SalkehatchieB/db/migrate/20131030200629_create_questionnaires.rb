class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.string :occupation
      t.string :why_participate
      t.integer :carpentry
      t.integer :plumbing
      t.integer :electrical
      t.integer :roofing
      t.integer :song_leader
      t.integer :bible
      t.integer :recreation
      t.integer :lifeguard
      t.integer :accounting
      t.integer :firstaid
      t.boolean :cpr_firstaid
      t.string :camp
      t.string :year
      t.boolean :site_leader
      t.text :involved_activities
      t.boolean :camp_director_approval
      t.date :camp_director_approval_date
      t.boolean :user_approval
      t.date :user_approval_date
      t.datetime :printed_date
      t.references :user, index: true

      t.timestamps
    end
  end
end
