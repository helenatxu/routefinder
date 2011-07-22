class Routecomment < ActiveRecord::Base
  
    belongs_to :route
    belongs_to :user
end
