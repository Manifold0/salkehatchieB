class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0, :null => false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


	  #Salkewhatever-specific
	  
	  t.string :first_name
	  t.string :last_name
	  t.string :preferred_name
	  t.string :address_line1
	  t.string :address_line2
	  t.string :city
	  t.string :zip
	  t.string :state
	  t.string :district
	  t.string :gender
	  t.string :tshirt_size
	  t.date :date_of_birth
	  t.string :phone_number
	  t.string :mobile_devices
	  t.string :service_provider
	  t.string :church
	  t.string :church_city
	  t.string :church_pastor

	  t.integer :permission_level
    #higher integer, higher priority
    #5 = admin
    #4 = camp director
    #3 = site leader
    #2= parents
    #1 = campers

	  t.boolean :background_check
	  t.date :background_check_date
	  t.string :photoID
	  t.string :signatureID

    t.references :camp
    t.references :site
	  
      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
  end
end
