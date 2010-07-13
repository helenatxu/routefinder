require 'digest/sha1'
class User < ActiveRecord::Base
  
  attr_protected :hashed_password, :enabled
  attr_accessor :password

  validates_presence_of :username, :message => 'you must write an user'
  validates_presence_of :email, :message => 'you must write an email'
  validates_uniqueness_of :username, :case_sensitive => false, :message => 'username already used'
  validates_uniqueness_of :email, :message => 'email already used'
  validates_length_of :profile, :maximum => 150
  validate :password_non_blank
  
  validates_format_of :photo_url, 
  :with => %r{\.(gif|jpg|png)$}i, 
  :message => 'must be a URL for GIF, JPG ' + 
  'or PNG image.' 



  def self.authenticate(username, password)
    user = self.find_by_name(username)
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end

  # 'password' is a virtual attribute
  def password
    @password 
  end

  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end
  
private
  
  def password_non_blank
    errors.add_to_base("Missing password" ) if hashed_password.blank?
  end
  
  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

  def self.encrypted_password(password, salt)
    string_to_hash = password + "wibble" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end
  
  def after_destroy
    if User.count.zero?
      raise "Can't delete last user"
    end
  end
end