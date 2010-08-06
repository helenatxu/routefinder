class CreatePlacecomments < ActiveRecord::Migration
  def self.up
    

    create_table :placecomments do |t|
      t.integer :place_id
      t.integer :user_id
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :placecomments
  end
end
