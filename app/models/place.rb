class Place < ActiveRecord::Base

  validates_presence_of :name, :coordinates_lat, :coordinates_long, :country, :date, :author, :description
  validates_format_of :image_url, 
  :with => %r{\.(gif|jpg|png)$}i, 
  :message => 'must be a URL for GIF, JPG ' + 
  'or PNG image.'

  def self.search(search, country)
    if search
      find(:all, :conditions => ['name LIKE ? and country LIKE ?',"%#{search}%", "%#{country}%"])
    else
      #find(:all, :condition => ['country LIKE ?', "%#{country}%"])
      find(:all)
      # find(:all, :conditions => ["name LIKE ? or country LIKE ?", "%#{search}%", "%#{search}%"], :order => 'service_date DESC')
    end
  end
end