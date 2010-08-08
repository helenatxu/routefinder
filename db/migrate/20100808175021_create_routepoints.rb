class CreateRoutepoints < ActiveRecord::Migration
  def self.up
    create_table :routepoints do |t|

        t.integer :place_id 
        t.integer :route_id
        t.integer :order
        
        t.timestamps
        
    end
  end

  def self.down
    drop_table :routepoints
  end
end

