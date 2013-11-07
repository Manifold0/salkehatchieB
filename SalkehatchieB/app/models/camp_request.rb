class CampRequest < ActiveRecord::Base
  belongs_to :user
  has_many :camps
  has_one :preference1, :class_name => "Camp", :foreign_key => "preference1_id"
  has_one :preference2, :class_name => "Camp", :foreign_key => "preference2_id"
  has_one :preference3, :class_name => "Camp", :foreign_key => "preference3_id"
end
