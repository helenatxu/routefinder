class CreateRoutes < ActiveRecord::Migration
  def self.up
    

    create_table :routes do |t|
      t.string :name
      t.float :rank
      t.integer :users_id
      t.text :description
      t.integer :places_id
      t.integer :comments_id

      t.timestamps
    end
  end

  def self.down
    drop_table :routes
  end
end
