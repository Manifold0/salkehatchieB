class CampAssignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :camp
end
