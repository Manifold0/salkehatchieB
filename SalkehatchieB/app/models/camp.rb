class Camp < ActiveRecord::Base
  belongs_to :camp_request

  has_many :camp_assignments
  
end
