class Route < ActiveRecord::Base
  
  acts_as_rateable
  
  validates_presence_of :name, :date, :author, :places, :description
  
  
  
end
