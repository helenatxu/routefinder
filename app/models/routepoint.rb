class Routepoint < ActiveRecord::Base
  
  belongs_to :route
  belongs_to :place
  
end
