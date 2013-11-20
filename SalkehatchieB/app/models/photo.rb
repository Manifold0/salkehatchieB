class Photo < ActiveRecord::Base
  belongs_to :user
  #mount_uploader :image, ImageUploader
  #has_many: sites
end
