class Schedule < ActiveRecord::Base
  belongs_to :camp
  belongs_to :event
end
