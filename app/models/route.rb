class Route < ActiveRecord::Base
  
  validates_presence_of :name, :date, :author, :places, :description
  
  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?',"%#{search}%"])
    else
      find(:all)
      # find(:all, :conditions => ["name LIKE ? or country LIKE ?", "%#{search}%", "%#{search}%"], :order => 'service_date DESC')
    end
  end
  
end
