class Placecomment < ActiveRecord::Base
  
  #  validates_presence_of :user_id, :date, :comment

    belongs_to :place
    belongs_to :user
    
end
