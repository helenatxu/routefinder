class PlacesRoutes < ActiveRecord::Migration

  def self.up
    create_table :places_routes, :id => false do |t| 
      t.integer :place_id 
      t.integer :route_id
    end

    add_index :places_routes, [:place_id, :route_id], :unique => true 
    add_index :places_routes, :route_id, :unique => false
  end

  def self.down
    drop_table :places_routes
  end

end
