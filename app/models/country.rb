class Country < ActiveRecord::Base
  
  has_many :places
  
  # find(:all, :conditions => ["name LIKE ? or country LIKE ?", "%#{search}%", "%#{search}%"], :order => 'service_date DESC')
  
end
