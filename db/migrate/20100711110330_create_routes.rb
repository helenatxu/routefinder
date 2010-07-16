class CreateRoutes < ActiveRecord::Migration
  def self.up
    

    create_table :routes do |t|
      t.string :name
      t.date :date
      t.float :rank
      t.integer :author_id
      t.text :description
      t.integer :places
      t.integer :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :routes
  end
end
