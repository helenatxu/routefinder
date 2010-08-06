class Place < ActiveRecord::Base

  has_and_belongs_to_many :routes # routes belongs from many routes and vice versa
  has_and_belongs_to_many :users # users can mark this route as favourite
  has_one :country
  belongs_to :user # one user is the author
  has_many :placecomments

  ajaxful_rateable :stars => 5, :allow_update => true, :cache_column => :rank, :dimensions => [:rank]
    
  validates_presence_of :name, :coordinates_lat, :coordinates_long, :country_id, :description
  validates_format_of :image_url, 
  :with => %r{\.(gif|jpg|png)$}i, 
  :message => 'must be a URL for GIF, JPG ' + 
  'or PNG image.'

end