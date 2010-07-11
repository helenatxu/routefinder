class Route < ActiveRecord::Base
  
  validates_presence_of :name, :date, :author, :places, :description
  
end
