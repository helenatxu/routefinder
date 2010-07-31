class Place < ActiveRecord::Base


  ajaxful_rateable :stars => 5, :allow_update => true, :cache_column => :rank, :dimensions => [:rank]
    
    
  validates_presence_of :name, :coordinates_lat, :coordinates_long, :countries_id, :description
  validates_format_of :image_url, 
  :with => %r{\.(gif|jpg|png)$}i, 
  :message => 'must be a URL for GIF, JPG ' + 
  'or PNG image.'


end
