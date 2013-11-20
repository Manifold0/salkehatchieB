class Cost < ActiveRecord::Base
	belongs_to :admin_approver, class_name: "User"
	belongs_to :created_by, class_name: "User"
end
