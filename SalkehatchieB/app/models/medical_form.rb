class MedicalForm < ActiveRecord::Base
  belongs_to :user
  belongs_to :camp
  mount_uploader :insurance_card_image, ImageUploader
end
