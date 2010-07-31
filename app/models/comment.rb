class Comment < ActiveRecord::Base
  
  validates_presence_of :users_id, :date, :comment
  
end
