class Schedule < ActiveRecord::Base
  belongs_to :camp
  has_many :event
end
