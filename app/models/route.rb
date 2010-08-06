class Route < ActiveRecord::Base
  
  has_and_belongs_to_many :places # places belongs from many routes and vice versa
  has_and_belongs_to_many :users # users can mark this route as favourite
  belongs_to :user # one user is the author
  
  ajaxful_rateable :stars => 5, :allow_update => true, :cache_column => :rank, :dimensions => [:rank]
  
  validates_presence_of :name, :user_id, :place_id, :description
    
end
