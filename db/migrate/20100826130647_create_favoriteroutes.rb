class CreateFavoriteroutes < ActiveRecord::Migration
  def self.up
    create_table :favoriteroutes do |t|
      t.integer :user_id
      t.integer :route_id
      t.timestamps
    end
  end

  def self.down
    drop_table :favoriteroutes
  end
end
