class Route < ActiveRecord::Base


  has_many :routepoints, :order => '"order" ASC'
  has_many :places, :through => :routepoints, :order => '"order" ASC'


  has_many :favoriteroutes
  has_many :users, :through => :favoriteroutes # users can mark this route as favourite
  
  
  belongs_to :user # one user is the author

  has_many :routecomments


  ajaxful_rateable :stars => 5, :allow_update => true, :cache_column => :rank, :dimensions => [:rank]

  validates_presence_of :name, :description

  validate_on_create :unique_name?
  


  def unique_name? 
    if Route.find_by_name(name) 
      errors.add(:name, "is already being used") 
    end 
  end



end
