class PlacesUsers < ActiveRecord::Migration
  def self.up
    create_table :places_users, :id => false do |t| 
      t.integer :user_id 
      t.integer :place_id
    end

    add_index :places_users, [:user_id, :place_id], :unique => true 
    add_index :places_users, :user_id, :unique => false
  end

  def self.down
    drop_table :places_users
  end
end
