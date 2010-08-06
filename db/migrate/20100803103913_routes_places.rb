class RoutesPlaces < ActiveRecord::Migration

  def self.up
    create_table :routes_places, :id => false do |t| 
      t.integer :place_id 
      t.integer :route_id
    end

    add_index :routes_places, [:place_id, :route_id], :unique => true 
    add_index :routes_places, :route_id, :unique => false
  end

  def self.down
  end

end
