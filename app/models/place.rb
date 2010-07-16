class Place < ActiveRecord::Base

  acts_as_rateable
    
  validates_presence_of :name, :coordinates_lat, :coordinates_long, :country, :date, :author, :description
  validates_format_of :image_url, 
  :with => %r{\.(gif|jpg|png)$}i, 
  :message => 'must be a URL for GIF, JPG ' + 
  'or PNG image.'


end
