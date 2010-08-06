class Routecomment < ActiveRecord::Base
  
  validates_presence_of :user_id, :date, :routecomment
  
end
