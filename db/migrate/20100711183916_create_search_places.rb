class CreateSearchPlaces < ActiveRecord::Migration
  def self.up
    create_table :search_places do |t|
      t.string :keywords
      t.string :country
      t.timestamps
    end
  end
  
  def self.down
    drop_table :search_places
  end
end
