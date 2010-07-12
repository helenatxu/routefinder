class CreateComments < ActiveRecord::Migration
  def self.up
    down
    create_table :comments do |t|
      t.string :author
      t.date :date
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
