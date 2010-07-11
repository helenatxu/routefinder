class Comment < ActiveRecord::Base
  
  validates_presence_of :author, :date, :comment
  
end
