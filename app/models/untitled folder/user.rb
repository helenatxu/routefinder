class User < ActiveRecord::Base
 # attr_accessible :username, :email, :password

  acts_as_authentic 
  ajaxful_rater
  #  attr_accessor :password, :password_confirmation 
  
  has_many :favoriteplaces
  has_many :places, :through => :favoriteplaces # as favorites
  
  has_many :favoriteroutes
  has_many :routes, :through => :favoriteroutes # as favorites
  

  
  has_many :places # as author
  has_many :routes # as author
  
  has_many :routecomments
  has_many :placecomments
  
end
