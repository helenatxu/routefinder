class User < ActiveRecord::Base
  
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
  validates_format_of :photo_url, 
  :with => %r{\.(gif|jpg|png)$}i, 
  :message => 'must be a URL for GIF, JPG ' + 
  'or PNG image.' 
  
  
end
