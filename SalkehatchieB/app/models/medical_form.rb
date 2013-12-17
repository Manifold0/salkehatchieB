class MedicalForm < ActiveRecord::Base
  belongs_to :user
  belongs_to :camp
  has_one :insurance_card_image, :class_name => "Photo", :foreign_key => "id"
  has_one :guardian_signature, :class_name => "Photo", :foreign_key => "id"
  mount_uploader :insurance_card_image, ImageUploader
end
