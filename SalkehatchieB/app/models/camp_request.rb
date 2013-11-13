class CampRequest < ActiveRecord::Base
  belongs_to :user
  has_many :camps
  has_one :preference1, :class_name => "Camp", :foreign_key => "id"
  has_one :preference2, :class_name => "Camp", :foreign_key => "id"
  has_one :preference3, :class_name => "Camp", :foreign_key => "id"
end
