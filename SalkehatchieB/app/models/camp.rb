class Camp < ActiveRecord::Base
  belongs_to :camp_request

  has_many :camp_assignments

  def num_of_campers
  	return self.camp_assignments.count
  end
  
end
