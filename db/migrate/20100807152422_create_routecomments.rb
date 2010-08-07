class CreateRoutecomments < ActiveRecord::Migration
  def self.up
    create_table :routecomments do |t|
      t.integer :route_id
      t.integer :user_id
      t.text :comment
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :routecomments
  end
end
