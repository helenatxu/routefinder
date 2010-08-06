class Route < ActiveRecord::Base
  
  
  ajaxful_rateable :stars => 5, :allow_update => true, :cache_column => :rank, :dimensions => [:rank]
  
  
  validates_presence_of :name, :user_id, :place_id, :description
  
  
  
end
