class AddDirectionToPlace < ActiveRecord::Migration
  def self.up
    add_column :places, :direction, :string
  end

  def self.down
    remove_column :places, :direction
  end
end


