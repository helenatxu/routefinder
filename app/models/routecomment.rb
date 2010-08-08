class Routecomment < ActiveRecord::Base
  
  #  validates_presence_of :user_id, :comment

    belongs_to :route
    belongs_to :user
end
