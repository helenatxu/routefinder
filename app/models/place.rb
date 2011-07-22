class Place < ActiveRecord::Base

  has_and_belongs_to_many :routes # routes belongs from many routes and vice versa
  
  has_many :routepoints
  has_many :routes, :through => :routepoints
    
    
  has_many :favoriteplaces
  has_many :users, :through => :favoriteplaces # users can mark this place as favourite

  belongs_to :country
  belongs_to :user # one user is the author
  has_many :placecomments

  ajaxful_rateable :stars => 5, :allow_update => true, :cache_column => :rank, :dimensions => [:rank]
    
  validates_presence_of :name, :description
  validates_format_of :image_url, 
  :with => %r{\.(gif|jpg|png)$}i, 
  :message => 'must be a URL for GIF, JPG ' + 
  'or PNG image.'


  validate_on_create :unique_name?
  


  def unique_name? 
    if Place.find_by_name(name) 
      errors.add(:name, "is already being used") 
    end 
  end



end