class User < ActiveRecord::Base

  validates_presence_of :username, :message => 'you must write an user'
  validates_presence_of :email, :message => 'you must write an email'
  validates_uniqueness_of :username, :message => 'username already used'
  validates_uniqueness_of :email, :message => 'email already used'
  
  validates_format_of :photo_url, 
  :with => %r{\.(gif|jpg|png)$}i, 
  :message => 'must be a URL for GIF, JPG ' + 
  'or PNG image.' 


  validates_confirmation_of :hashed_password 
  validate :password_non_blank 

  private 
  def password_non_blank 
    errors.add("Password") if hashed_password.blank? 
  end 
  
end 

