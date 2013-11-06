class CampRequest < ActiveRecord::Base
  belongs_to :user
  has_many :camps
end
