class Country < ActiveRecord::Base
  
  belongs_to :place
  
  # find(:all, :conditions => ["name LIKE ? or country LIKE ?", "%#{search}%", "%#{search}%"], :order => 'service_date DESC')
  
end
