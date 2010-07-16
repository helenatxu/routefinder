class CreatePlaces < ActiveRecord::Migration

  def self.up

    create_table :places do |t|
      t.string :name
      t.decimal :coordinates_lat
      t.decimal :coordinates_long
      t.integer :country
      t.date :date
      t.integer :rank
      t.string :author
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end

  def self.down
    drop_table :places
  end
end
