class CreateRoutes < ActiveRecord::Migration
  def self.up

    create_table :routes do |t|
      t.string :name
      t.date :date
      t.integer :rank
      t.string :author
      t.text :description
      t.integer :places

      t.timestamps
    end
  end

  def self.down
    drop_table :routes
  end
end
