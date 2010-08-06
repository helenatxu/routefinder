class RoutesUsers < ActiveRecord::Migration
  def self.up
    create_table :routes_users, :id => false do |t| 
      t.integer :user_id 
      t.integer :route_id
    end

    add_index :routes_users, [:user_id, :route_id], :unique => true 
    add_index :routes_users, :user_id, :unique => false
  end

  def self.down
    drop_table :routes_users
  end
end
