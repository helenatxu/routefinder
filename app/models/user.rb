require 'digest/sha1'
class User < ActiveRecord::Base
  
  ajaxful_rater
  
  attr_protected :is_admin
  attr_accessor :password

  validates_presence_of :username, :message => 'you must write an user'
  validates_presence_of :email, :message => 'you must write an email'
  validates_uniqueness_of :username, :case_sensitive => false, :message => 'username already used'
  validates_uniqueness_of :email, :message => 'email already used'
  validates_length_of :profile, :maximum => 150


  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"
  
  validates_format_of :photo_url, 
  :with => %r{\.(gif|jpg|png)$}i, 
  :message => 'must be a URL for GIF, JPG ' + 
  'or PNG image.' 
  
  
  def self.random_string(len)
     #generate a random password consisting of strings and digits
     chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
     newpass = ""
     1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
     return newpass
   end
   
   
   def password=(pass)
     @password=pass
     self.salt = User.random_string(10) if !self.salt?
     self.hashed_password = User.encrypt(@password, self.salt)
   end
   
   
   def self.encrypt(pass, salt)
     Digest::SHA1.hexdigest(pass+salt)
   end
   
   
   def self.authenticate(username, password)
     u = find(:first, :conditions=>["username = ?", username])
     return false if u.nil?
     return u if User.encrypt(password, u.salt) == u.hashed_password
     false
   end

end
