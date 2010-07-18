class Route < ActiveRecord::Base
  
  
  ajaxful_rateable :stars => 5, :allow_update => true, :cache_column => :rank, :dimensions => [:rank]
  
  
  validates_presence_of :name, :author_id, :places_id, :description
  
  
  
end
