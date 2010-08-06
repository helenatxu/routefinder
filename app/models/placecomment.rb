class Placecomment < ActiveRecord::Base
  
  validates_presence_of :user_id, :date, :placecomment
  
end
