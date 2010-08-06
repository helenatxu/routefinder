class CreatePlaces < ActiveRecord::Migration

  def self.up


    create_table :places do |t|
      t.string :name
      t.decimal :coordinates_lat
      t.decimal :coordinates_long
      t.string :direction
      t.integer :country_id
      t.float :rank
      t.integer :user_id
      t.text :description
      t.string :image_url


      t.timestamps
    end
  end

  def self.down
    drop_table :places
  end
end
