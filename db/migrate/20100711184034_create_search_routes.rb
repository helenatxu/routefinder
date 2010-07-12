class CreateSearchRoutes < ActiveRecord::Migration
  def self.up
    create_table :search_routes do |t|
      t.string :keywords
      t.string :place_name
      t.string :country
      t.timestamps
    end
  end
  
  def self.down
    drop_table :search_routes
  end
end
