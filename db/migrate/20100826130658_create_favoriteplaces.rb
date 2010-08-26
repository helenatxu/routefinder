class CreateFavoriteplaces < ActiveRecord::Migration
  def self.up
    create_table :favoriteplaces do |t|
      t.integer :user_id
      t.integer :place_id
      t.timestamps
    end  
  end

  def self.down
    drop_table :favoriteplaces
  end
end
