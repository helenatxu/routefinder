class AddRatingAverageToRoutes < ActiveRecord::Migration

  def self.up 
    add_column :routes, :rating_average_rank, :decimal, :default => 0, :precision => 6, :scale => 2 
  end 
  def self.down 
    remove_column :routes, :rating_average 
  end 
end 
