class User < ActiveRecord::Base
 # attr_accessible :username, :email, :password

  acts_as_authentic 
  #  attr_accessor :password, :password_confirmation 
  
  has_and_belongs_to_many :places # as favourites
  has_and_belongs_to_many :routes # as favourites
  
  has_many :places # as author
  has_many :routes # as favourites
  
  has_many :routecomments
  has_many :placecomments
  
end
