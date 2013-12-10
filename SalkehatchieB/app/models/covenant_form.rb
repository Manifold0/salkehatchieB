class CovenantForm < ActiveRecord::Base
  belongs_to :user
  mount_uploader :user_signature, ImageUploader
end
